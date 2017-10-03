%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 十月 2017 上午8:34
%%%-------------------------------------------------------------------
-module(records).
-author("lth").
-compile(export_all).

%% API
-export([]).

%% records
-include("records.hrl").
-record(robot, {name,
                type=industrial,
                hobbies,
                details=[]}).

-record(user, {id, name, group, age}).

%% functions
first_robot() ->
  #robot{name = "Mechatron",
        type = handmade,
        details = ["Moved by a small man inside"]}.

car_factory(CorpName) ->
  #robot{name = CorpName, hobbies = "building cars"}.

%% use pattern matching to filter
admin_panel(#user{name = Name, group = admin}) ->
  Name ++ " is allowed!";
admin_panel(#user{name = Name}) ->
  Name ++ " is not allowed".

%% can extend user record
adult_section(U = #user{}) when U#user.age >= 18 ->
  %% show stuff that can not be written in such text
  allowed;
adult_section(_) ->
  %% redirect to another site
  forbidden.

%% update a record
repairman(Rob) ->
  Details = Rob#robot.details,
  NewRob = Rob#robot{details = ["Repaired by repairman"|Details]},
  {repaired, NewRob}.

%% test include
included() -> #included{some_field = "Some value"}.