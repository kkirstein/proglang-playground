// fib.test.ts
// test for fib module
//
// vim: ft=typescript sw=4 ts=4
//

import { fib, fib_naive } from "../fib.ts";
import { expect, test, describe, it } from "bun:test"

describe('Fibonacci module', function () {

	it('should expose naive & efficient implementations', function () {
		expect(fib_naive).toBeFunction();
		expect(fib).toBeFunction();
	});

});

describe('Fibonacci (naive implementation)', function () {

	it('should return a number', function () {
		expect(fib_naive(1)).toBeNumber();
	});

	it('should return correct results', function () {
		expect(fib_naive(0)).toEqual(0);
		expect(fib_naive(1)).toEqual(1);
		expect(fib_naive(2)).toEqual(1);
		expect(fib_naive(3)).toEqual(2);
		expect(fib_naive(4)).toEqual(3);
		expect(fib_naive(5)).toEqual(5);
		expect(fib_naive(6)).toEqual(8);
	});
});

describe('Fibonacci (efficient implementation)', function () {

	it('should return a number', function () {
		expect(fib_naive(1)).toBeNumber();
	});

	it('should return correct results', function () {
		expect(fib(0).toString()).toEqual('0');
		expect(fib(1).toString()).toEqual('1');
		expect(fib(2).toString()).toEqual('1');
		expect(fib(3).toString()).toEqual('2');
		expect(fib(4).toString()).toEqual('3');
		expect(fib(5).toString()).toEqual('5');
		expect(fib(6).toString()).toEqual('8');
	});

	it('should perform fast', function () {
		expect(fib(35).toString()).toEqual('9227465');
		expect(fib(1000).toString()).toEqual(
			'43466557686937456435688527675040625802564660517371' +
			'78040248172908953655541794905189040387984007925516' +
			'92959225930803226347752096896232398733224711616429' +
			'96440906533187938298969649928516003704476137795166' +
			'849228875');
	});
});

