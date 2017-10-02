%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 十月 2017 下午9:53
%%%-------------------------------------------------------------------
-module(road).
-author("lth").

%% API
-export([main/0]).

main() ->
  File = "road.txt",
  {ok, Bin} = file:read_file(File),
  optimal_path(parse_map(Bin)).

parse_map(Bin) when is_binary(Bin) ->
  parse_map(binary_to_list(Bin));
parse_map(Str) when is_list(Str) ->
  Values = [list_to_integer(X) || X <- string:tokens(Str,"\r\n\t ")],
  group_vals(Values, []).

group_vals([], Acc) ->
  lists:reverse(Acc);
group_vals([A,B,X|Rest], Acc) ->
  group_vals(Rest, [{A,B,X}|Acc]).

shortest_step({A,B,X}, {{DistA,PathA}, {DistB, PAthB}}) ->
  OptA1 = {DistA + A, [{a,A}|PathA]},
  OptA2 = {DistB + B + X, [{x,X}, {b,B}|PAthB]},
  OptB1 = {DistB + B, [{b,B}|PAthB]},
  OptB2 = {DistA + A + X, [{x,X}, {a,A}|PathA]},
  {erlang:min(OptA1, OptA2), erlang:min(OptB1, OptB2)}.

optimal_path(Map) ->
  {A, B} = lists:foldl(fun shortest_step/2, {{0,[]}, {0,[]}}, Map),
  {_Dist, Path} = if hd(element(2, A)) =/= {x,0} -> A;
                    hd(element(2, B)) =/= {x,0} -> B
                  end,
  lists:reverse(Path).