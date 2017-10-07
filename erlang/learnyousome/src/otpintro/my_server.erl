%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 十月 2017 上午10:21
%%%-------------------------------------------------------------------
-module(my_server).
-author("lth").
%-compile(export_all).

%% API
-export([call/2, start/2, start_link/2, cast/2, reply/2]).

start(Module, InitialState) ->
  spawn(fun() -> init(Module, InitialState) end).

start_link(Module, InitialState) ->
  spawn_link(fun() -> init(Module, InitialState) end).

call(Pid, Msg) ->
  Ref = erlang:monitor(process, Pid),
  Pid ! {sync, self(), Ref, Msg},
  receive
    {Ref, Reply} ->
      erlang:demonitor(Ref, [flush]),
      Reply;
    {'DOWN', Ref, process, Pid, Reason} ->
      erlang:error(Reason)
  after 5000 ->
    erlang:error(timeout)
  end.

cast(Pid, Msg) ->
  Pid ! {async, Msg},
  ok.

reply({Pid, Ref}, Reply) ->
  Pid ! {Ref, Reply}.

%% private funcs
loop(Module, State) ->
  receive
    {ansyc, Msg} ->
      loop(Module, Module:handle_cast(Msg, State));
    {sync, Pid, Ref, Msg} ->
      loop(Module, Module:handle_call(Msg, {Pid, Ref}, State))
  end.

init(Module, State) ->
  receive
    {ansyc, Msg} ->
      loop(Module, Module:handle_cast(Msg, State));
    {sync, Pid, Ref, Msg} ->
      loop(Module, Module:handle_call(Msg, {Pid, Ref}, State))
  end.