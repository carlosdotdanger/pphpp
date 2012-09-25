-module(pphpp_tests).
-include_lib("eunit/include/eunit.hrl").
-include ("test_defs.hrl").

-import(pphpp,[	get_service_args/2,
				get_service_args/4,
				config_to_args/1]).



args_test_()->
	[
		{"config_to_args", 
			assert_config_args(config_to_args(?TEST_CONFIG))},
       	{"name_and_script", 
       	assert_args(get_service_args(?TEST_EXEC,?TEST_SCRIPT))},
        {"name_script_max_and_timeout",
        	assert_args(get_service_args(?TEST_EXEC,?TEST_SCRIPT,?TEST_MAX,?TEST_TIMEOUT))}
   ].

%HELPERZ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
assert_args(Term)->
    fun() -> 
        ?assertEqual(?SHORT_ARGS, Term)
    end.

assert_config_args(Term)->
    fun() -> 
        ?assertEqual(?LONG_ARGS, Term)
    end.

