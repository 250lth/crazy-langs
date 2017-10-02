%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 十月 2017 上午10:35
%%%-------------------------------------------------------------------
-module(useless).
-author("lth").
-compile([debug_info, export_all]).

%% API
-export([add/2, hello/0, greet_and_add_two/1]).

add(A, B) ->
  A + B.

%% Show welcome
%% io:format/1 is standard func
hello() ->
  io:format("Hello, World!~n").

greet_and_add_two(X) ->
  hello(),
  add(X, 2).
