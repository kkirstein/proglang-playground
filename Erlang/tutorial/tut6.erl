-module(tut6).
-export([list_max/1, list_min/1]).

% Find the maximum element in a list
list_max([Head | Tail]) ->
    list_max(Tail, Head).

% Local helper function for list_max
list_max([], Max) ->
    Max;
list_max([Head | Tail], Max) when Head > Max ->
    list_max(Tail, Head);
list_max([_Head | Tail], Max) ->
    list_max(Tail, Max).

% Find the minimum element in a list
list_min([Head | Tail]) ->
    list_min(Tail, Head).

% Local helper function for list_min
list_min([], Min) ->
    Min;
list_min([Head | Tail], Min) when Head < Min ->
    list_min(Tail, Head);
list_min([_Head | Tail], Min) ->
    list_min(Tail, Min).
