// perfect_numbers.js
// Calculate perfect numbers in JavaScript
//
// vim: ft=javascript sw=4 ts=4
//

'use strict';

// predicate to check for perfect number
function isperfect(n) {
	var sum = 0;
	for (var i = 0; i < n; i++) {
		if ((n % i) === 0) { sum += i; }
	}
	return (sum == n);
}

// simple generator with fixed upper limit
function perfect_numbers (n) {
	var res = [];
	for (let i = 1; i < n; i++) {
		if (isperfect(i)) { res.push(i); }
	}
	return res;
}

// new (ES6) generator scheme
function* sequence () {
	var current = 1;
	 while (true) {
		 if (isperfect(current)) { yield current; }
		 current++;
	 }
}


// exports
exports.isperfect = isperfect;
exports.perfect_numbers = perfect_numbers;
exports.sequence = sequence;

