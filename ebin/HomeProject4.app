{application, 'HomeProject4', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['cache_server','cache_server_app','cache_server_ets','cache_server_sup','cache_server_worker']},
	{registered, []},
	{applications, [kernel,stdlib]},
	{env, []}
]}.