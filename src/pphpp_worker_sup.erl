
-module(pphpp_worker_sup).

-behaviour(supervisor).

%% API
-export([start_link/2]).

%% Supervisor callbacks
-export([init/1,get_child/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(Args), 
	{pphpp_worker, {pphpp_worker, start_link, Args}, 
	temporary, 2000, worker, [pphpp_worker]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link(Name,Args)->
	supervisor:start_link({local, Name}, ?MODULE, [Args]).

get_child(Name)->
	supervisor:start_child(Name,[]).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init(Args) ->
    {ok, { {simple_one_for_one, 0, 1}, [?CHILD(Args)]} }.



