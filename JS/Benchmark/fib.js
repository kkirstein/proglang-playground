// fib.js
// Calculate Fibonacci numbers in JavaScript
//
// vim: ft=javascript sw=4 ts=4
//


exports.fib_naive = function (n) {
	return (n < 2)? n : arguments.callee(n-1) + arguments.callee(n-2);
};

exports.fib = function (n) {
	return function(n, a, b) {
		return (n === 0)? a : arguments.callee(n-1, b, a+b);
	}(n, 0, 1);
};



