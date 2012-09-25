-module(pphpp_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
	Specs = case application:get_env(pphpp,services) of
		{ok,Services} -> pphpp:config_to_service_specs(Services);
		_ -> []
	end,
    pphpp_sup:start_link(Specs).

stop(_State) ->
    ok.
