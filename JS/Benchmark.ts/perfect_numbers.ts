// perfect_numbers.ts
// Calculate perfect numbers in JavaScript
//
// vim: ft=javascript sw=4 ts=4
//

// predicate to check for perfect number
export function isperfect(n: number): boolean {
	var sum = 0;
	for (var i = 0; i < n; i++) {
		if ((n % i) === 0) { sum += i; }
	}
	return (sum == n);
}

// simple generator with fixed upper limit
export function perfect_numbers (n:number): number[] {
	var res = [];
	for (let i = 1; i < n; i++) {
		if (isperfect(i)) { res.push(i); }
	}
	return res;
}

// new (ES6) generator scheme
export function* sequence (): Generator<number> {
	var current = 1;
	 while (true) {
		 if (isperfect(current)) { yield current; }
		 current++;
	 }
}
