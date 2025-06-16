// test-colormap.ts
// test for Colormap set module
//
// vim: ft=typescript sw=4 ts=4
//

'use strict';

import { Colormap } from "../colormap";
import { describe, expect, it } from "bun:test";

describe('Colormap module', function () {

	it('should export colormap array', function () {
		expect(Colormap).toBeArray();
		expect(Colormap).toHaveLength(217);
	});

	it('should contain RGB entries', function () {
		Colormap.forEach( function (e) {
			expect(e).toHaveLength(3);
		});
	});
});



