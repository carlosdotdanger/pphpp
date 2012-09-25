-define (TEST_EXEC, "/usr/bin/php").
-define (TEST_SCRIPT, "/home/carlos/src/pphpp/php/test.php").
-define (TEST_MAX, 100).
-define (TEST_TIMEOUT, 2000).

-define (LONG_ARGS, [{"/usr/bin/php",
        	[{args,["/home/carlos/src/pphpp/php/test.php","chumbawumba"]},
        	{env,[{"ENVIRONMENT","production"}]},
        	{dir,"/home/carlos"},
        	binary,exit_status,{packet,4}]},500,5000]).
-define (SHORT_ARGS, [{"/usr/bin/php",
        	[{args,["/home/carlos/src/pphpp/php/test.php"]},
        	binary,exit_status,{packet,4}]},100,2000]).

-define (TEST_CONFIG,[
	{php_exec,"/usr/bin/php"},
	{php_script,"/home/carlos/src/pphpp/php/test.php"},
	{php_args,["chumbawumba"]},
	{php_env ,[{"ENVIRONMENT","production"}]},
	{php_working_dir,"/home/carlos"},
	{php_max_calls,500},
	{php_call_timeout,5000} 
	]).
-define(MULTI_CONFIG,
	[
	{example_service_1,[
		{php_exec,"/usr/bin/php"},
		{php_script,"/home/carlos/src/pphpp/php/test.php"},
		{php_args,["chumbawumba"]},
		{php_env ,[{"ENVIRONMENT","production"}]},
		{php_working_dir,"/home/carlos"},
		{php_max_calls,500},
		{php_call_timeout,5000}],
	{example_service_2,[
		{php_exec,"/usr/bin/php"},
		{php_script,"/home/carlos/src/pphpp/php/test.php"},
		{php_args,["littlebigfoot","crumbtastic","silent"]},
		{php_env ,[{"ENVIRONMENT","toxic"}]},
		{php_working_dir,"/home/on/the/range"},
		{php_max_calls,200},
		{php_call_timeout,6000}],	
	]
).
