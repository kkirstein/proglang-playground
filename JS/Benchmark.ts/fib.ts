// fib.js
// Calculate Fibonacci numbers in JavaScript
//
// vim: ft=javascript sw=4 ts=4
//

//var BigInt = require('@stdlib/bigint');

// naive & efficient (BigInt) implementation
export function fib_naive(n:number): number {
	return (n < 2) ? n : fib_naive(n - 1) + fib_naive(n - 2);
}

function _fib_aux(n:number, a:bigint, b:bigint): bigint {
	return (n === 0) ? a : _fib_aux(n - 1, b, a + b );
}

export function fib(n:number): bigint {
	return _fib_aux(n, BigInt(0), BigInt(1));
}
