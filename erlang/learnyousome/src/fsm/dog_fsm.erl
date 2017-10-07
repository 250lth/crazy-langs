%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 十月 2017 下午4:00
%%%-------------------------------------------------------------------
-module(dog_fsm).
-author("lth").

%% API
-export([start/0, squirrel/1, pet/1]).

start() ->
  spawn(fun() -> bark() end).

squirrel(Pid) -> Pid ! squirrel.

pet(Pid) -> Pid ! pet.

bark() ->
  io:format("Dog says: BARK! BARK~n"),
  receive
    pet ->
      wag_tail();
    _ ->
      io:format("Dog is confused~n"),
      bark()
  after 2000 ->
    bark()
  end.

wag_tail() ->
  io:format("Dog wags its tail~n"),
  receive
    pet ->
      sit();
    _ ->
      io:format("Dog is confused~n"),
      wag_tail()
  after 30000 ->
    bark()
  end.

sit() ->
  io:format("Dog is sitting. Gooooood boy~n"),
  receive
    squirrel ->
      bark();
    _ ->
      io:format("Dog is confused~n"),
      sit()
  end.