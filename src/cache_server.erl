-module(cache_server).
%%API
-export([start_link/1, insert/3, lookup/1, lookup_by_date/2]).

%%API
start_link([{drop_interval,Interval}]) when is_integer(Interval) ->
	{ok,Pid} = cache_server_worker:start_link(Interval*1000),
	{ok,Pid};
start_link([]) ->
	Interval = 120,
	{ok,Pid} = cache_server_worker:start_link(Interval*1000),
	{ok,Pid}.


insert(Key, Value, LiveTime) ->
	gen_server:call(cache_server_worker,{insert,{Key,Value,LiveTime}}).

lookup(Key) ->
	gen_server:call(cache_server_worker,{lookup,{Key}}).

lookup_by_date(DateFrom, DateTo) ->
	gen_server:call(cache_server_worker,{lookup_by_date,{DateFrom, DateTo}}).
