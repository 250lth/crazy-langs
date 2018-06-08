-module(mod_name_server).
-export([start_me_up/3]).

start_me_up(MM, _Args, _Args) ->
    loop(MM).

loop(MM) ->
    receive
        {chan, MM, {store, K, V}} ->
            kvs:store(K, V),
            loop(MM);
        {chan, MM, {lookup, K}} ->
            MM ! {senf, hvs:lookup(K)},
                  loop(MM);
        {chan_closed, MM} ->
            true
    end.
