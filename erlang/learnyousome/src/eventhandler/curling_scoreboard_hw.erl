%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 十月 2017 下午3:48
%%%-------------------------------------------------------------------
-module(curling_scoreboard_hw).
-author("lth").

%% API
-export([set_teams/2, next_round/0, add_points/1, reset_board/0]).

%% show teams on the scoreboard
set_teams(TeamA, TeamB) ->
  io:format("Scoreboard: Team ~s vs. Team ~s~n", [TeamA, TeamB]).

next_round() ->
  io:format("Scoreboard: round over~n").

add_points(Team) ->
  io:format("Scoreboard: increased score of team ~s by 1~n", [Team]).

reset_board() ->
  io:format("Scoreboard: All teams are undefined and all scores are 0~n").