-module(dep_tests).

-include_lib("eunit/include/eunit.hrl").

simple_test() ->
    ?assert(length(dep:use_proto()) > 0).

simpler_test() ->
    ?assertEqual(ok, dep:test()).

use_hdr_test() ->
    {pb_noise_message, _, _} = dep:use_hdr().

