// Main.hx
// main entry class to run micro-benchmarks
//
// vim: ft=haxe sw=2 ts=2
//

package benchmark;

import haxe.Timer;
import benchmark.Fib;
import benchmark.PerfectNumber;

import Sys;

class Main {


	static public function main():Void {

		trace("Fibonacci numbers");
		trace("=================");
		var naive = function() { return Fib.naiveFib(35); }
		var res = timeit(naive);
		trace('naiveFib(35) = ${res}');

		var tr = function() { return Fib.fib(1000); }
		var res = timeit(tr);
		trace('fib(1000) = $res');
		
		trace("");
		trace("Perfect numbers");
		trace("===============");
		var pn = function() { return PerfectNumber.perfectNumbers(10000); }
		var res = timeit(pn);
		trace('Perfect numbers (< 10000): $res');

		trace("");
		trace("Done.");
}

	static function timeit<T>(fun:Void->T) : T {
		var tic = Sys.cpuTime();
		var res = fun();
		var toc = Sys.cpuTime();
		var elapsed_ms = (toc-tic)*1000;
		trace('Elapsed time ${elapsed_ms}ms:');

		return res;
	}

}

