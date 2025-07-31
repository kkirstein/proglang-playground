-module(tut8).
-export([reverse/1]).

reverse(List) ->
    reverse(List, []).

% Local helper function for reverse
reverse([Head | Tail], Reversed) ->
    reverse(Tail, [Head | Reversed]);
reverse([], Reversed) ->
    Reversed.
