-module(cache_server).
%%API
-export([start_link/1, insert/3, lookup/1, lookup_by_date/2]).

%%API
start_link([{drop_interval,Interval}]) when is_integer(Interval) ->
	cache_server_app:start([],[Interval*1000]),
	Pid = whereis(worker),
	{ok,Pid};
start_link([]) ->
	Interval = 120,
	cache_server_app:start([],[Interval*1000]),
	Pid = whereis(worker),
	{ok,Pid}.


insert(Key, Value, LiveTime) ->
	gen_server:call(whereis(worker),{insert,{Key,Value,LiveTime}}).

lookup(Key) ->
	gen_server:call(whereis(worker),{lookup,{Key}}).

lookup_by_date(DateFrom, DateTo) ->
	gen_server:call(whereis(worker),{lookup_by_date,{DateFrom, DateTo}}).
