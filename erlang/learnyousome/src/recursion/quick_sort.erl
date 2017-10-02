%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 十月 2017 下午3:25
%%%-------------------------------------------------------------------
-module(quick_sort).
-author("lth").

%% API
-export([quicksort/1, lc_quicksort/1, best_qsort/1]).

quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
  {Smaller, Larger} = partition(Pivot, Rest, [], []),
  quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_, [], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
  if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
    H > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
  end.

%% better quick sort with list comprehensions.
lc_quicksort([]) -> [];
lc_quicksort([Pivot|Rest]) ->
  lc_quicksort([Smaller || Smaller <- Rest, Smaller =< Pivot])
  ++ [Pivot] ++
  lc_quicksort([Larger || Larger <- Rest, Larger > Pivot]).

%% best quick sort
best_qsort([]) -> [];
best_qsort(L=[_|_]) ->
  best_qsort(L, []).

best_qsort([], Acc) -> Acc;
best_qsort([Pivot|Rest], Acc) ->
  best_partition(Pivot, Rest, {[], [Pivot], []}, Acc).

best_partition(_, [], {Smaller, Equal, Larger}, Acc) ->
  best_qsort(Smaller, Equal ++ best_qsort(Larger, Acc));
best_partition(Pivot, [H|T], {Smaller, Equal, Larger}, Acc) ->
  if H < Pivot ->
    best_partition(Pivot, T, {[H|Smaller], Equal, Larger}, Acc);
    H > Pivot ->
      best_partition(Pivot, T, {Smaller, Equal, [H|Larger]}, Acc);
    H == Pivot ->
      best_partition(Pivot, T, {Smaller, [H|Equal], Larger}, Acc)
  end.
