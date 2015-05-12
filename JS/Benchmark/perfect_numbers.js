// perfect_numbers.js
// Calculate perfect numbers in JavaScript
//
// vim: ft=javascript sw=4 ts=4
//

function isperfect(n) {
	var sum = 0;
	for (var i = 0; i < n; i++) {
		if ((n % i) === 0) { sum += i; }
	}
	return (sum == n);
}

// exports
exports.isperfect = isperfect;
exports.perfect_numbers = function (n) {
	var res = [];
	for (var i = 1; i < n; i++) {
		if (isperfect(i)) { res.push(i); }
	}
	return res;
};

