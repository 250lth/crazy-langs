%%%-------------------------------------------------------------------
%%% @author lth
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 十月 2017 下午3:55
%%%-------------------------------------------------------------------
-module(gen_event_callback).
-author("lth").
-behavior(gen_event).

%% API
-export([init/1, handle_info/2, handle_event/2, handle_call/2, code_change/3, terminate/2]).

init([]) -> {ok, []}.

handle_event(_, State) -> {ok, State}.

handle_call(_, State) -> {ok, ok, State}.

handle_info(_, State) -> {ok, State}.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

terminate(_Reason, _State) -> ok.