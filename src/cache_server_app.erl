-module(cache_server_app).
-behaviour(application).
-author("Kalyta Bogdan").

%% application callbacks
-export([start/2, stop/1]).

%% application callbacks
start(_Type,Args) ->
	
	cache_server_sup:start_link(Args).

stop(_State) ->
	ok.
