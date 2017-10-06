%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 十月 2017 下午8:24
%%%-------------------------------------------------------------------
-module(hotload).
-author("lth").

%% API
-export([server/1, upgrade/1]).

server(State) ->
  receive
    update ->
      NewState = ?MODULE:upgrade(State),
      ?MODULE:server(NewState);
    SomeMessage ->
      server(State)
  end.

upgrade(OldState) ->
  %% turn state and return state
  ?MODULE ! upgrade(OldState). %=> cheating!!!