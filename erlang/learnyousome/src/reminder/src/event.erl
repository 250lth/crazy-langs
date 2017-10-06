%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 十月 2017 下午4:26
%%%-------------------------------------------------------------------
-module(event).
-author("lth").

%% API
-export([start/2, start_link/2, cancel/1, init/3, loop/1]).

-record(state, {server,
                name="",
                to_go=0}).

%% Public interface
start(EventName, Delay) ->
  spawn(?MODULE, init, [self(), EventName, Delay]).

start_link(EventName, Delay) ->
  spawn_link(?MODULE, init, [self(), EventName, Delay]).

init(Server, EventName, DateTime) ->
  loop(#state{server = Server,
              name = EventName,
              to_go = time_to_go(DateTime)}).

cancel(Pid) ->
  Ref = erlang:monitor(process, Pid),
  Pid ! {self(), Ref, cancel},
  receive
    {Ref, ok} ->
      erlang:demonitor(Ref, [flush]),
      ok;
    {'DOWN', Ref, process, Pid, _Reason} ->
      ok
  end.

%% The core func
loop(S = #state{server = Server, to_go = [T|Next]}) ->
  receive
    {Server, Ref, cancel} ->
      Server ! {Ref, ok}
  after T * 1000 ->
    if Next =:= [] ->
      Server ! {done, S#state.name};
      Next =/= [] ->
        loop(S#state{to_go = Next})
    end
  end.

%% private funcs
normalize(N) ->
  Limit = 49*24*60*60,
  [N rem Limit | lists:duplicate(N div Limit, Limit)].

time_to_go(TimeOut={{_,_,_}, {_,_,_}}) ->
  Now = calendar:local_time(),
  ToGo = calendar:datetime_to_gregorian_seconds(TimeOut) -
        calendar:datetime_to_gregorian_seconds(Now),
  Secs = if ToGo > 0 -> ToGo;
           ToGo =< 0 -> 0
         end,
  normalize(Secs).