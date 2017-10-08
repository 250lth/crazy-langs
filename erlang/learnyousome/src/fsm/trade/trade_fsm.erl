%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 十月 2017 下午8:13
%%%-------------------------------------------------------------------
-module(trade_fsm).
-author("lth").
-behavior(gen_fsm).

%% public APIs
-export([start/1, start_link/1, trade/2, accept_trade/1,
    make_offer/2, retract_offer/2, ready/1, cancel/1]).

%% gen_fsm callbacks
-export([init/1, handle_event/3, handle_sync_event/4, handle_info/3,
  terminate/3, code_change/4,
  idle/2, idle/3, idle_wait/2, idle_wait/3, negotiate/2, negotiate/3,
  wait/2, ready/2, ready/3]).
-record(state, {name = "",
                other,
                ownitems = [],
                otheritems = [],
                monitor,
                from}).

%%% public apis
start(Name) ->
  gen_statem:start(?MODULE, [Name], []).

start_link(Name) ->
  gen_statem:start_link(?MODULE, [Name], []).

% ask for begin session, return when accepted
trade(OwnPid, OtherPid) ->
  gen_statem:call(OwnPid, {negotiate, OtherPid}, 30000).

% Accept someone's trade offer
accept_trade(OwnPid) ->
  gen_statem:call(OwnPid, accept_negotiate).

% Select an item to trade
make_offer(OwnPid, Item) ->
  gen_statem:cast(OwnPid, {make_offer, Item}).

% Cancel an offer
retract_offer(OwnPid, Item) ->
  gen_statem:cast(OwnPid, {retract_offer, Item}).

% Mention you are ready to trade
ready(OwnPid) ->
  gen_statem:call(OwnPid, ready, infinity).

% Cancel the transaction
cancel(OwnPid) ->
  gen_statem:call(OwnPid, cancel).


%%% Client to client, fsm to fsm
% ask the other fsm for a trade session
ask_negotiate(OtherPid, OwnPid) ->
  gen_statem:cast(OtherPid, {ask_negotiate, OwnPid}).

% forward the client message accepting the transaction
accept_negotiate(OtherPid, OwnPid) ->
  gen_statem:cast(OtherPid, {accept_negotiate, OwnPid}).

% forward a client's offer
do_offer(OtherPid, Item) ->
  gen_statem:cast(OtherPid, {do_offer, Item}).

% forward a client's offer cancellation
undo_offer(OtherPid, Item) ->
  gen_statem:cast(OtherPid, {undo_offer, Item}).

% ask if ready
are_you_ready(OtherPid) ->
  gen_statem:cast(OtherPid, are_you_ready).

% reply not ready yet
not_yet(OtherPid) ->
  gen_statem:cast(OtherPid, not_yet).

% Tell the other i am ready
am_ready(OtherPid) ->
  gen_statem:cast(OtherPid, 'ready!').

% Ensure fsm is ready
ack_trans(OtherPid) ->
  gen_statem:cast(OtherPid, ack).

% Ask if ready to commit
ask_commit(OtherPid) ->
  gen_statem:call(OtherPid, ask_commit).

% Start sync commit
do_commit(OtherPid) ->
  gen_statem:call(OtherPid, do_commit).

% aware when cancel
notify_cancel(OtherPid) ->
  gen_statem:cast(OtherPid, cancel).


%%% gen_fsm callbacks
init(Name) ->
  {ok, idle, #state{name = Name}}.

%% idle states
% The other player asks for a negotiation.
idle({ask_negotiate, OtherPid}, S=#state{}) ->
  Ref = monitor(process, OtherPid),
  notice(S, "~p asked for a trade negotiation", [OtherPid]),
  {next_state, idle_wait, S#state{other = OtherPid, monitor = Ref}};
idle(Event, Data) ->
  unexpected(Event, idle),
  {next_state, idle, Data}.

% our user ask for a trade
idle({negotiate, OtherPid}, From, S=#state{}) ->
  ask_negotiate(OtherPid, self()),
  notice(S, "asking user ~p for a trade", [OtherPid]),
  Ref = monitor(process, OtherPid),
  {next_state, idle_wait, S#state{other = OtherPid, monitor = Ref, from = From}};
idle(Event, _From, Data) ->
  unexpected(Event, idle),
  {next_state, idle, Data}.

% wait the other side's message
idle_wait({ask_negotiate, OtherPid}, S=#state{other = OtherPid}) ->
  gen_statem:reply(S#state.from, ok),
  notice(S, "starting negotiation", []),
  {next_state, negotiate, S};
idle_wait({accept_negotiate, OtherPid}, S=#state{other = OtherPid}) ->
  gen_statem:reply(S#state.from, ok),
  notice(S, "starting negotiation", []),
  {next_state, negotiate, S};
idle_wait(Event, Data) ->
  unexpected(Event, idle_wait),
  {next_state, idle_wait, Data}.

% wait, our user accept the other's offer
idle_wait(accept_negotiate, _From, S=#state{other = OtherPid}) ->
  accept_negotiate(OtherPid, self()),
  notice(S, "accepting negotiation", []),
  {reply, ok, negotiate, S};
idle_wait(Event, _From, Data) ->
  unexpected(Event, idle_wait),
  {next_state, idle_wait, Data}.

% ownside offering an item
negotiate({make_offer, Item}, S=#state{ownitems = OwnItems}) ->
  do_offer(S#state.other, Item),
  notice(S, "offering ~p", [Item]),
  {next_state, negotiate, S#state{ownitems = add(Item, OwnItems)}};
% ownside retracting an item
negotiate({retract_offer, Item}, S=#state{ownitems = OwnItems}) ->
  undo_offer(S#state.other, Item),
  notice(S, "cancelling offer on ~p", [Item]),
  {next_state, negotiate, S#state{ownitems = remove(Item, OwnItems)}};
% other side offer an item
negotiate({do_offer, Item}, S=#state{otheritems = OtherItems}) ->
  notice(S, "other player offering ~p", [Item]),
  {next_state, negotiate, S#state{otheritems = add(Item, OtherItems)}};
% other side retracting an item
negotiate({undo_offer, Item}, S=#state{otheritems = OtherItems}) ->
  notice(S, "Other player cancelling offer on ~p", [Item]),
  {next_state, negotiate, S#state{otheritems = remove(Item, OtherItems)}};
% deal with are_you_ready
negotiate(are_you_ready, S=#state{other = OtherPid}) ->
  io:format("Other user ready to trade.~n"),
  notice(S,
    "Other user ready to transfer goods:~n"
    "You get ~p, The other side gets ~p",
    [S#state.otheritems, S#state.ownitems]),
  not_yet(OtherPid),
  {next_state, negotiate, S};
negotiate(Event, Data) ->
  unexpected(Event, negotiate),
  {next_state, negotiate, Data}.

% other side has declared itself already
negotiate(ready, From, S = #state{other = OtherPid}) ->
  are_you_ready(OtherPid),
  notice(S, "asking if ready, waiting", []),
  {next_state, wait, S#state{from = From}};
negotiate(Event, _From, S) ->
  unexpected(Event, negotiate),
  {next_state, negotiate, S}.

% wait states
wait({do_offer, Item}, S=#state{otheritems = OtherItems}) ->
  gen_statem:reply(S#state.from, offer_changed),
  notice(S, "other side offering ~p", [Item]),
  {next_state, negotiate, S#state{otheritems = add(Item, OtherItems)}};
wait({undo_offer, Item}, S=#state{otheritems = OtherItems}) ->
  gen_statem:reply(S#state.from, offer_changed),
  notice(S, "Other side cancelling offer of ~p", [Item]),
  {next_state, ndgotiate, S#state{otheritems = remove(Item, OtherItems)}};
wait(are_you_ready, S=#state{}) ->
  am_ready(S#state.other),
  notice(S, "asked if ready, and I am. Waiting for same reply", []),
  {next_state, wait, S};
wait(not_yet, S=#state{}) ->
  notice(S, "Other not ready yet", []),
  {next_state, wait, S};
wait('ready', S=#state{}) ->
  am_ready(S#state.other),
  ack_trans(S#state.other),
  gen_statem:reply(S#state.from, ok),
  notice(S, "other side is ready. Moving to ready state", []),
  {next_state, ready, S};
wait(Event, Data) ->
  unexpected(Event, wait),
  {next_state, wait, Data}.

% ready state
ready(ack, S=#state{}) ->
  case priority(self(), S#state.other) of
    true ->
      try
        notice(S, "asking for commit", []),
          ready_commit = ask_commit(S#state.other),
          ok = do_commit(S#state.other),
          commit(S),
        {stop, normal, S}
      catch Class:Reason ->
        notice(S, "commit failed", []),
        {stop, {Class, Reason}, S}
      end;
    false ->
      {next_state, ready, S}
  end;
ready(Event, Data) ->
  unexpected(Event, ready),
  {next_state, ready, Data}.

ready(ask_commit, _From, S) ->
  notice(S, "replying to ask_commit", []),
  {reply, ready_commit, ready, S};
ready(do_commit, _From, S) ->
  notice(S, "committing...", []),
  commit(S),
  {stop, normal, ok, S};
ready(Event, _From, Data) ->
  unexpected(Event, ready),
  {next_state, ready, Data}.

handle_event(cancel, _StateName, S=#state{}) ->
  notice(S, "received cancel event", []),
  {stop, other_cancelled, S};
handle_event(Event, StateName, Data) ->
  unexpected(Event, StateName),
  {next_state, StateName, Data}.

handle_sync_event(cancel, _From, _StateName, S = #state{}) ->
  notify_cancel(S#state.other),
  notice(S, "cancelling trade, sending cancel event", []),
  {stop, cancelled, ok, S};
handle_sync_event(Event, _From, StateName, Data) ->
  unexpected(Event, StateName),
  {next_state, StateName, Data}.

handle_info({'DOWN', Ref, process, Pid, Reason}, _, S=#state{other = Pid, monitor = Ref}) ->
  notice(S, "Other side dead", []),
  {stop, {other_down, Reason}, S};
handle_info(Info, StateName, Data) ->
  unexpected(Info, StateName),
  {next_state, StateName, Data}.

code_change(_OldVsn, StateName, Data, _Extra) ->
  {ok, StateName, Data}.

terminate(normal, ready, S=#state{}) ->
  notice(S, "FSM leaving", []);
terminate(_Reason, _StateName, _StateData) ->
  ok.

%%% private funcs

% send player a notice
notice(#state{name = N}, Str, Args) ->
  io:format("~s: " ++Str++"~n", [N|Args]).

% log unexpected messages
unexpected(Msg, State) ->
  io:format("~p received unknown event ~p while in state ~p~n",
    [self(), Msg, State]).

% add an item to list
add(Item, Items) ->
  [Item|Items].

% remove an item from list
remove(Item, Items) ->
  Items -- [Item].

% compare tow pids
priority(OwnPid, OtherPid) when OwnPid > OtherPid -> true;
priority(OwnPid, OtherPid) when OwnPid < OtherPid -> false.

% commit the offer
commit(S = #state{}) ->
  io:format("Transaction completed for ~s. "
            "Items sent are:~n~p, ~n received are: ~n~p.~n"
            "This operation should have some atomic save "
            "in a database.~n",
    [S#state.name, S#state.ownitems, S#state.otheritems]).