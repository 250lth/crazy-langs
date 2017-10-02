%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 十月 2017 下午4:20
%%%-------------------------------------------------------------------
-module(hhfuns).
-author("lth").
-compile(export_all).

%% API
-export([]).

%% Everything is function
one() -> 1.
two() -> 2.

add(X, Y) -> X() + Y().

increment([]) -> [];
increment([H|T]) -> [H+1|increment(T)].

decrement([]) -> [];
decrement([H|T]) -> [H-1|decrement(T)].

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].

incr(X) -> X + 1.
decr(X) -> X - 1.


%% anonymous functions: funs
a() ->
  Secret = "pony",
  fun() -> Secret end.

b(F) ->
  "a/0's password is " ++ F().

%%% map, filter and fold

%% filter
even(L) -> lists:reverse(even(L, [])).

even([], Acc) -> Acc;
even([H|T], Acc) when H rem 2 == 0 ->
  even(T, [H|Acc]);
even([_|T], Acc) ->
  even(T, Acc).

old_men(L) -> lists:reverse(old_men(L, [])).

old_men([], Acc) -> Acc;
old_men([Person = {male, Age}|People], Acc) when Age > 60 ->
  old_men(People, [Person|Acc]);
old_men([_|People], Acc) ->
  old_men(People, Acc).

filter(Pred, L) -> lists:reverse(filter(Pred, L, [])).

filter(_, [], Acc) -> Acc;
filter(Pred, [H|T], Acc) ->
  case Pred(H) of
    true -> filter(Pred, T, [H|Acc]);
    false -> filter(Pred, T, Acc)
  end.

%% fold
max([H|T]) -> max2(T, H).

max2([], Max) -> Max;
max2([H|T], Max) when H > Max -> max2(T, H);
max2([_|T], Max) -> max2(T, Max).

min([H|T]) -> min2(T, H).

min2([], Min) -> Min;
min2([H|T], Min) when H < Min -> min2(T, H);
min2([_|T], Min) -> min2(T, Min).

sum(L) -> sum(L, 0).

sum([], Sum) -> Sum;
sum([H|T], Sum) -> sum(T, H+Sum).

fold(_, Start, []) -> Start;
fold(F, Start, [H|T]) -> fold(F, F(H, Start), T).

reverse(L) ->
  fold(fun(X, Acc) -> [X|Acc] end, [], L).

map2(F, L) ->
  reverse(fold(fun(X, Acc) -> [F(X)|Acc] end, [], L).

filter2(Pred, L) ->
  F = fun(X, Acc) ->
    case Pred(X) of
      true -> [X|Acc];
      false -> Acc
    end
      end,
  reverse(fold(F, [], L)).