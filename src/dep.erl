-module(dep).

%% API
-export([test/0, use_proto/0, use_hdr/0]).

-include("noise_server.hrl").
-include("dep.hrl").

test() -> ?OK.

use_proto() ->
    noise_server:get_all_proto_names().

use_hdr() ->
    #pb_noise_message{message_type = 'XX_A', content = <<>>}.
