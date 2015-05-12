// test-perfect_numbers.js
// test for perfect_numbers module
//
// vim: ft=javascript sw=4 ts=4
//

'use strict';

var pn = require('../perfect_numbers.js');
var expect = require('expect.js');

describe('PerfectNumbers module', function () {

	it('should export predicate and generator functions', function () {
		expect(pn.isperfect).to.be.a('function');
		expect(pn.perfect_numbers).to.be.a('function');
		expect(pn.sequence).to.be.a('function');
	});

	it('should return correct numbers (1..10)', function () {
		expect(pn.isperfect(1)).not.to.be(true);
		expect(pn.isperfect(2)).not.to.be(true);
		expect(pn.isperfect(3)).not.to.be(true);
		expect(pn.isperfect(4)).not.to.be(true);
		expect(pn.isperfect(5)).not.to.be(true);
		expect(pn.isperfect(6)).to.be(true);
		expect(pn.isperfect(7)).not.to.be(true);
		expect(pn.isperfect(8)).not.to.be(true);
		expect(pn.isperfect(9)).not.to.be(true);
		expect(pn.isperfect(10)).not.to.be(true);
	});

	it('should calculate first 3 perfect numbers', function () {
		var res = pn.perfect_numbers(1000);
		expect(res[0]).to.equal(6);
		expect(res[1]).to.equal(28);
		expect(res[2]).to.equal(496);
	});

	it('sequence should return an generator', function () {
		expect(pn.sequence).to.be.a('function');
		var gen = pn.sequence().next();
		//expect(gen).to.be.an('Generator');
		expect(gen).to.have.property('value');
		expect(gen).to.have.property('done');
	});

	it('generator should give sequence of perfect numbers', function () {
		var gen = pn.sequence();
		expect(gen.next().value).to.be(6);
		expect(gen.next().value).to.be(28);
		expect(gen.next().value).to.be(496);
		expect(gen.next().value).to.be(8128);
	});
});

