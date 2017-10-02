%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 十月 2017 下午2:25
%%%-------------------------------------------------------------------
-module(cases).
-author("lth").

%% API
-export([insert/2, beach/1]).

insert(X,[]) ->
  [X];
insert(X,Set) ->
  case lists:member(X,Set) of
    true -> Set;
    false -> [X|Set]
  end .

beach(Temperature) ->
  case Temperature of
    {celsius, N} when N >= 20, N =< 45 ->
      'favorable';
    {kelvin, N} when N >= 293, N =< 318 ->
      'scientifically favorable';
    {fahrenheit, N} when N >= 68, N =< 113 ->
      'favorable in the US';
    _ ->
      'avoid beach'
  end .
