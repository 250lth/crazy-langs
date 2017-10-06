%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 十月 2017 下午10:25
%%%-------------------------------------------------------------------
-module(sup).
-author("lth").

%% API
-export([]).

start(Mod, Args) ->
  spawn(?MODULE, init, [{Mod, Args}]).

start_link(Mod, Args) ->
  spawn_link(?MODULE, init, [{Mod, Args}]).

init({Mod, Args}) ->
  process_flag(trap_exit, true),
  loop({Mod, start_link, Args}).

loop({M,F,A}) ->
  Pid = apply(M,F,A),
  receive
    {'EXIT', _From, shutdown} ->
      exit(shutdown);
    {'EXIT', Pid, Reason} ->
      io:format("Process ~p exited for reason ~p~n", [Pid, Reason]),
      loop({M,F,A})
  end.