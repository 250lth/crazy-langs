%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 十月 2017 下午3:07
%%%-------------------------------------------------------------------
-module(kitty_gen_server).
-author("lth").
-behavior(gen_server).

%% API
-export([start_link/0, order_cat/4, return_cat/2, close_shop/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(cat, {name, color = green, description}).

start_link() ->
  gen_server:start_link(?MODULE, [], []).

%% sync call
order_cat(Pid, Name, Color, Description) ->
  gen_server:call(Pid, {order, Name, Color, Description}).

%% async call
return_cat(Pid, Cat = #cat{}) ->
  gen_server:cast(Pid, {return, Cat}).

%% sync call
close_shop(Pid) ->
  gen_server:call(Pid, terminate).

%% server funcs
init([]) -> {ok, []}.

handle_call({order, Name, Color, Description}, _From, Cats) ->
  if Cats =:= [] ->
    {reply, make_cat(Name, Color, Description), Cats};
    Cats =/= [] ->
      {reply, hd(Cats), tl(Cats)}
  end;
handle_call(terminate, _From, Cats) ->
  {stop, normal, ok, Cats}.

handle_cast({return, Cat = #cat{}}, Cats) ->
  {noreply, [Cat|Cats]}.

handle_info(Msg, Cats) ->
  io:format("Unexpected message: ~p~n", [Msg]),
  {noreply, Cats}.

terminate(normal, Cats) ->
  [io:format("~p was set free.~n", [C#cat.name]) || C <- Cats],
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.

%% private
make_cat(Name, Col, Desc) ->
  #cat{name = Name, color = Col, description = Desc}.