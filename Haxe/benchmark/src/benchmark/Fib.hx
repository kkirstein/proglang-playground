// Fib.hx
// Calculate Fibonacci numbers in Haxe
//
// vim: ft=haxe sw=2 ts=2
//

package benchmark;

class Fib {

	public static function naiveFib(n:Int) : Int {
		if (n < 2) return n
		else {
			return naiveFib(n-2) + naiveFib(n-1);
		}
	}

	public static function fib(n:Int) : Float {

		// local helper function
		function _fib(n:Int, a:Float, b:Float) : Float {
			if (n == 0) {
				return a;
			} else {
				return _fib(n-1, b, a+b);
			}
		}

		return _fib(n, 0.0, 1.0);
	}

	// TODO: BigInt implementation
}


