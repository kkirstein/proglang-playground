-module(tut7).
-export([format_temps/1]).

% Exported function
format_temps(List_of_cities) ->
    Converted_list = convert_list_to_c(List_of_cities),
    print_temp(Converted_list),
    {Max_city, Min_city} = find_max_min(Converted_list),
    print_max_min(Max_city, Min_city).

% Convert a list of cities with temperatures from Fahrenheit to Celsius
convert_list_to_c([{Name, {f, F}} | Tail]) ->
    Converted_city = {Name, {c, (F - 32) * 5 / 9}},
    [Converted_city | convert_list_to_c(Tail)];
convert_list_to_c([City | Tail]) ->
    [City | convert_list_to_c(Tail)];
convert_list_to_c([]) ->
    [].

% Print the temperatures in a formatted way
print_temp([{Name, {c, Temp}} | Tail]) ->
    io:format("~-15w ~w °C~n", [Name, Temp]),
    print_temp(Tail);
print_temp([]) ->
    ok.

% Find the minimum and maximum temperature in a list of cities
find_max_min([City | Tail]) ->
    find_max_min(Tail, City, City).

find_max_min([{Name, {c, Temp}} | Tail], {Max_city, {c, Max_temp}}, {Min_city, {c, Min_temp}}) ->
    New_max = if Temp > Max_temp -> {Name, {c, Temp}}; true -> {Max_city, {c, Max_temp}} end,
    New_min = if Temp < Min_temp -> {Name, {c, Temp}}; true -> {Min_city, {c, Min_temp}} end,
    find_max_min(Tail, New_max, New_min);
find_max_min([], Max_city, Min_city) ->
    {Max_city, Min_city}.

% Print the maximum and minimum temperatures
print_max_min({Max_city, {c, Max_temp}}, {Min_city, {c, Min_temp}}) ->
    io:format("Maximum Temperature: ~-15w °C in ~w~n", [Max_temp, Max_city]),
    io:format("Minimum Temperature: ~-15w °C in ~w~n", [Min_temp, Min_city]).