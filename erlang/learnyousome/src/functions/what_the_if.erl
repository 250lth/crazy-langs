%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 十月 2017 下午2:14
%%%-------------------------------------------------------------------
-module(what_the_if).
-author("lth").

%% API
-export([heh_fine/0, oh_god/1, help_me/1]).

heh_fine() ->
  if 1 =:= 1 ->
    works
  end,
  if 1 =:= 2; 1 =:= 1 ->
    works
  end,
  if 1 =:= 2, 1 =:= 1 ->
    fails
  end.

oh_god(N) ->
  if N =:= 2 -> might_succeed;
    true -> always_does
  end.

%% This function should be in pattern matching way.
help_me(Animal) ->
  Talk = if Animal == cat -> "meow";
           Animal == beef -> "mooo";
           Animal == dog -> "bark";
           Animal == tree -> "bark";
           true -> "fagafdfafasfds"
         end,
  {Animal, "says " ++ Talk ++ "!"}.