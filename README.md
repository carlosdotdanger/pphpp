pphpp
=====

Persistent PHP Port for erlang 

purpose
=======


An experiment to check the feasibility of keeping an open php port for rpc calls to services that 
have high initialization overhead without re-initializing php with every call. https://github.com/skeltoac/php_app 
was sort of close, but I didn't want an eval loop, just to expose a defined rpc interface.



