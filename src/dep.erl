-module(dep).

%% API
-export([test/0]).

-include("dep.hrl").

test() -> ?OK.
