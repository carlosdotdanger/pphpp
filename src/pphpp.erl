-module(pphpp).

-export ([call/2,
		  new/1,
		  status/1,
		  stop/1]).

-export([start_service/2,
		start_service/3,
		start_service/5,
		stop_service/1]).

-export([config_to_args/1,config_to_service_specs/1]).

-define (DEFAULT_CALL_TIMEOUT, 2000).
-define (DEFAULT_MAX_CALLS, 100).

start_service(Name,Args) when is_list(Args)->
	pphpp_sup:start_service(Name,Args).
start_service(Name,PhpExec,Script)->
	start_service(Name,get_service_args(PhpExec,Script)).
start_service(Name,PhpExec,Script,MaxCalls,TimeOut)->
	start_service(Name,get_service_args(PhpExec,Script,MaxCalls,TimeOut)).	

stop_service(Name)->
	pphpp_sup:stop_service(Name).


call(Pid,Data)->
	pphpp_worker:php_call(Pid,Data).

status(Pid)->
	pphpp_worker:status(Pid).

stop(Pid)->
	pphpp_worker:stop(Pid).
	
new(Name)->
	pphpp_worker_sup:get_child(Name).



get_service_args(PhpExec,Script)->
	config_to_args([{php_exec,PhpExec},{php_script,Script}]).
get_service_args(PhpExec,Script,MaxCalls,TimeOut)->
	config_to_args([{php_exec,PhpExec},{php_script,Script},
						{php_max_calls,MaxCalls},{php_call_timeout,TimeOut}]).

config_to_args(Config)->
	PhpExec =  proplists:get_value(php_exec,Config),
	Script =  proplists:get_value(php_script,Config),
	CallTimeOut = 
		proplists:get_value(php_call_timeout,Config,?DEFAULT_CALL_TIMEOUT),
	MaxCalls = proplists:get_value(php_max_calls,Config,?DEFAULT_MAX_CALLS),
	Args = case proplists:get_value(php_args,Config) of
			undefined -> {args,[Script]};
			A -> {args,[Script|A]}
		end,
	Dir = case proplists:get_value(php_working_dir,Config) of
			undefined -> undefined;
			D -> {dir,D}
		end,
	Env = case proplists:get_value(php_env,Config) of
			undefined -> undefined;
			E -> {env,E}
		end,	
	Opts = [ X || X <-[Args,Env,Dir,binary,exit_status,{packet,4}], X =/= undefined],
	[{PhpExec,Opts},MaxCalls,CallTimeOut].

config_to_service_specs(Config) when is_list(Config)->
	[{Name,config_to_args(Conf)} || {Name,Conf} <- Config ].


