-module(pphpp_tests).
-include_lib("eunit/include/eunit.hrl").
-include ("test_defs.hrl").

-import(pphpp,[	
				config_to_args/1]).



args_test_()->
	[
		{"config_to_args", 
			assert_config_args(config_to_args(?TEST_CONFIG))}
  ].

%HELPERZ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


assert_config_args(Term)->
    fun() -> 
        ?assertEqual(?LONG_ARGS, Term)
    end.

assert_service_spec(Term)->
    fun() -> 
        ?assertEqual(?LONG_ARGS, Term)
    end.

