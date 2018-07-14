-module(cache_server_sup).
-behaviour(supervisor).

%% API
-export([start_link/1, start_worker/1]).

%% supervisor callbacks
-export([init/1]).

%% API
start_link(Args) ->
	supervisor:start_link({global, ?MODULE}, ?MODULE, Args).

start_worker(Args) ->
	supervisor:start_child(?MODULE,[Args]).

%% supervisor callbacks
init(Args) ->

	Worker = #{
		id       => cache_server_worker,
		start    => {cache_server_worker, start_link, Args}, 
		restart  => transient, 
		shutdown => brutal_kill, 
		type     => worker, 
		modules  => [cache_server_worker]
		  },
{ok, {{one_for_one, 1000, 1}, [Worker]}}.

