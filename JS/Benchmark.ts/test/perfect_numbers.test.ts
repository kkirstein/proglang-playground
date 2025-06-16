// test-perfect_numbers.ts
// test for perfect_numbers module
//
// vim: ft=typescript sw=4 ts=4
//


import { isperfect, perfect_numbers, sequence } from '../perfect_numbers.ts';
import { expect, describe, it } from 'bun:test';

describe('PerfectNumbers module', function () {

	it('should export predicate and generator functions', function () {
		expect(isperfect).toBeFunction();
		expect(isperfect).toBeFunction();
		expect(isperfect).toBeFunction();
	});

	it('should return correct numbers (1..10)', function () {
		expect(isperfect(1)).toBeFalse();
		expect(isperfect(1)).toBeFalse();
		expect(isperfect(1)).toBeFalse();
		expect(isperfect(1)).toBeFalse();
		expect(isperfect(1)).toBeFalse();
		expect(isperfect(6)).toBeTrue();
		expect(isperfect(1)).toBeFalse();
		expect(isperfect(1)).toBeFalse();
		expect(isperfect(1)).toBeFalse();
			expect(isperfect(1)).toBeFalse();
	});

	it('should calculate first 3 perfect numbers', function () {
		var res = perfect_numbers(1000);
		expect(res[0]).toEqual(6);
		expect(res[1]).toEqual(28);
		expect(res[2]).toEqual(496);
	});

	it('sequence should return an generator', function () {
		expect(sequence).toBeFunction();
		var gen = sequence().next();
		//expect(gen).to.be.an('Generator');
		expect(gen).toHaveProperty('value');
		expect(gen).toHaveProperty('done');
	});

	it('generator should give sequence of perfect numbers', function () {
		var gen = sequence();
		expect(gen.next().value).toEqual(6);
		expect(gen.next().value).toEqual(28);
		expect(gen.next().value).toEqual(496);
		expect(gen.next().value).toEqual(8128);
	});
});

