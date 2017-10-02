%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 十月 2017 下午2:52
%%%-------------------------------------------------------------------
-module(more_rec).
-author("lth").

%% API
-export([duplicate/2, tail_duplicate/2, reverse/1, tail_reverse/1, sublist/2, tail_sublist/2,
  zip/2, tail_zip/2, lenient_zip/2, tail_lenient_zip/2]).

%% duplicate will create a list of duplicated elements,
duplicate(0,_) ->
  [];
duplicate(N,Term) when N > 0 ->
  [Term|duplicate(N-1,Term)].

tail_duplicate(N,Term) ->
  tail_duplicate(N,Term,[]).

tail_duplicate(0,_,List) ->
  List;
tail_duplicate(N,Term,List) when N > 0 ->
  tail_duplicate(N-1,Term,[Term|List]).

%% Reverse a list
reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].

tail_reverse(L) -> tail_reverse(L,[]).

tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T,[H|Acc]).

%% sublist, return the first N elements of a list.
sublist(_,0) -> [];
sublist([],_) -> [];
sublist([H|T],N) when N > 0 -> [H|sublist(T,N-1)].

tail_sublist(L,N) -> reverse(tail_sublist(L,N,[])).

tail_sublist(_,0,SubList) -> SubList;
tail_sublist([],_,SubList) -> SubList;
tail_sublist([H|T],N,SubList) when N > 0 ->
  tail_sublist(T,N-1,[H|SubList]).

%% zip: combine 2 lists to a tuple list.
zip([],[]) -> [];
zip([X|Xs],[Y|Ys]) -> [{X,Y}|zip(Xs,Ys)].

tail_zip(X,Y) -> reverse(tail_zip(X,Y,[])).

tail_zip([],[],Acc) -> Acc;
tail_zip([X|Xs],[Y|Ys],Acc) ->
  tail_zip(Xs,Ys,[{X,Y}|Acc]).

lenient_zip([],_) -> [];
lenient_zip(_,[]) -> [];
lenient_zip([X|Xs],[Y|Ys]) -> [{X,Y}|lenient_zip(Xs,Ys)].

tail_lenient_zip(X,Y) -> reverse(tail_lenient_zip(X,Y,[])).

tail_lenient_zip([],_,Acc) -> Acc;
tail_lenient_zip(_,[],Acc) -> Acc;
tail_lenient_zip([X|Xs],[Y|Ys],Acc) ->
  tail_lenient_zip(Xs,Ys,[{X,Y}|Acc]).
