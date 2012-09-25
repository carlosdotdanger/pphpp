
-module(pphpp_sup).

-behaviour(supervisor).

%% API
-export([start_link/1,start_service/2,stop_service/1]).

%% Supervisor callbacks
-export([init/1,child_spec/2]).


%% ===================================================================
%% API functions
%% ===================================================================

start_link(Specs) when is_list(Specs)->
    supervisor:start_link({local, ?MODULE}, ?MODULE, Specs).
   
child_spec(Name, Args)-> 
	{Name, {pphpp_worker_sup, start_link, [Name,Args]}, 
	permanent, 5000, supervisor, [pphpp_worker_sup]}.

start_service(Name,Args)->
	supervisor:start_child(?MODULE,child_spec(Name,Args)).

stop_service(Name)->
	case supervisor:terminate_child(?MODULE,Name) of
		ok-> supervisor:delete_child(?MODULE,Name);
		Err -> Err
	end.

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init(Specs) ->
	Children = [child_spec(Name,Args) || {Name,Args} <-Specs],
    {ok, { {one_for_one, 5, 10}, Children} }.




