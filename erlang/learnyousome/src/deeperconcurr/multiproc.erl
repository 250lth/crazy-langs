%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 十月 2017 下午3:32
%%%-------------------------------------------------------------------
-module(multiproc).
-author("lth").
-compile(export_all).

%% API

sleep(T) ->
  receive
    after T -> ok
  end.

flush() ->
  receive
    _ -> flush()
  after 0 ->
    ok
  end.

important() ->
  receive
    {Priority, Message} when Priority > 10 ->
      [Message | important()]
  after 0 ->
    normal()
  end.

normal() ->
  receive
    {_, Message} ->
      [Message | normal()]
  after 0 ->
    []
  end.