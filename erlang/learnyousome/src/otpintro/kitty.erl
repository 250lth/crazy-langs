%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 十月 2017 上午9:57
%%%-------------------------------------------------------------------
-module(kitty).
-author("lth").

%% API
-export([start_link/0, order_cat/4, return_cat/2, close_shop/1]).

-record(cat, {name, color = green, description}).

%% User API
start_link() ->
  spawn_link(fun init/0).

%% sync call
order_cat(Pid, Name, Color, Description) ->
  Ref = erlang:monitor(process, Pid),
  Pid ! {self(), Ref, {order, Name, Color, Description}},
  receive
    {Ref, Cat} ->
      erlang:demonitor(Ref, [flush]),
      Cat;
    {'DOWN', Ref, process, Pid, Reason} ->
      erlang:error(Reason)
  after 5000 ->
    erlang:error(timeout)
  end.

%% async call
return_cat(Pid, Cat = #cat{}) ->
  Pid ! {return, Cat},
  ok.

%% sync call
close_shop(Pid) ->
  Ref = erlang:monitor(process, Pid),
  Pid ! {self(), Ref, terminate},
  receive
    {Ref, ok} ->
      erlang:demonitor(Ref, [flush]),
      ok;
    {'DOWN', Ref, process, Pid, Reason} ->
      erlang:error(Reason)
  after 5000 ->
    erlang:error(timeout)
  end.

%%% server func
init() -> loop([]).

loop(Cats) ->
  receive
    {Pid, Ref, {order, Name, Color, Description}} ->
      if Cats =:= [] ->
        Pid ! {Ref, make_cat(Name, Color, Description)},
        loop(Cats);
        Cats =/= [] ->
          Pid ! {Ref, hd(Cats)},
          loop(tl(Cats))
      end;
    {return, Cat = #cat{}} ->
      loop([Cat|Cats]);
    {Pid, Ref, terminate} ->
      Pid ! {Ref, ok},
      terminate(Cats);
    Unknown ->
      io:format("Unknown message ~p~n", [Unknown]),
      loop(Cats)
  end.

%% private funcs
make_cat(Name, Col, Desc) ->
  #cat{name = Name, color = Col, description = Desc}.

terminate(Cats) ->
  [io:format("~p was set free.~n", [C#cat.name]) || C <- Cats],
  ok.

