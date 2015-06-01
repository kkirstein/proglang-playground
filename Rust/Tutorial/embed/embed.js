// embed.rb
// a threading for using rust code
// from ruby
//
// vim: ft=javascript sw=4 ts=4

'use strict';

var ffi = require('ff');

var lib = ffi.Library('target/release/libembed', {
	'process': [ 'void', [] ]
});

lib.process();

console.log("done!");

