-module(tut5).
-export([format_temps/1]).

% Exported function
format_temps([]) ->
    ok;
format_temps([City | Rest]) ->
    print_temp(convert_to_celsius(City)),
    format_temps(Rest).

% Local functions
convert_to_celsius({Name, {c, Temp}}) ->
    {Name, {c, Temp}};
convert_to_celsius({Name, {f, Temp}}) ->
    {Name, {c, (Temp - 32) * 5 / 9}}.

print_temp({Name, {c, Temp}}) ->
    io:format("~-15w ~w °C~n", [Name, Temp]).
