// test-fib.js
// test for fib module
//
// vim: ft=javascript sw=4 ts=4
//

'use strict';

var fib = require('../fib.js');
var BigInt = require('BigInt');
var expect = require('expect.js');

describe('Fibonacci module', function () {

	it('should expose naive & efficient implementations', function () {
		expect(fib.fib_naive).to.be.a('function');
		expect(fib.fib).to.be.a('function');
	});

});

describe('Fibonacci (naive implementation)', function () {

	it('should return a number', function () {
		expect(fib.fib_naive(1)).to.be.a('number');
	});

	it('should return correct results', function () {
		expect(fib.fib_naive(0)).to.equal(0);
		expect(fib.fib_naive(1)).to.equal(1);
		expect(fib.fib_naive(2)).to.equal(1);
		expect(fib.fib_naive(3)).to.equal(2);
		expect(fib.fib_naive(4)).to.equal(3);
		expect(fib.fib_naive(5)).to.equal(5);
		expect(fib.fib_naive(6)).to.equal(8);
	});
});

describe('Fibonacci (efficient implementation)', function () {

	it('should return a number', function () {
		expect(fib.fib_naive(1)).to.be.a('number');
	});

	it('should return correct results', function () {
		expect(BigInt.bigInt2str(fib.fib(0), 10)).to.equal('0');
		expect(BigInt.bigInt2str(fib.fib(1), 10)).to.equal('1');
		expect(BigInt.bigInt2str(fib.fib(2), 10)).to.equal('1');
		expect(BigInt.bigInt2str(fib.fib(3), 10)).to.equal('2');
		expect(BigInt.bigInt2str(fib.fib(4), 10)).to.equal('3');
		expect(BigInt.bigInt2str(fib.fib(5), 10)).to.equal('5');
		expect(BigInt.bigInt2str(fib.fib(6), 10)).to.equal('8');
	});

	it('should perform fast', function () {
		expect(BigInt.bigInt2str(fib.fib(35), 10)).to.equal('9227465');
		expect(BigInt.bigInt2str(fib.fib(1000), 10)).to.equal(
			'43466557686937456435688527675040625802564660517371' +
			'78040248172908953655541794905189040387984007925516' +
			'92959225930803226347752096896232398733224711616429' +
			'96440906533187938298969649928516003704476137795166' +
			'849228875');
	});
});

