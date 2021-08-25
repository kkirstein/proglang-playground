% vim: set ft=prolog:
%
% check for numeric properties, like even/odd

test(1, odd).
test(2, even).

test(X, Z) :-
	test(Y, Z),
	X is Y + 2 .

%is_even(X) :- Z = even, test(X, Z).
%is_odd(X) :- Z = odd, test(X, Z).


