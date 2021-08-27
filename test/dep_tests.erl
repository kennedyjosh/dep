-module(dep_tests).

-include_lib("eunit/include/eunit.hrl").

simple_test() ->
    ?assertEqual(ok, dep:test()).
