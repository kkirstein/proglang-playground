// PerfectNumber.hx
// Calculate Fibonacci numbers in Haxe
//
// vim: ft=haxe sw=2 ts=2
//

package benchmark;

using Lambda;

class PerfectNumber {

	// checks whether a given integer is perfect
	public static function isPerfect(n:Int) : Bool {

		function _loop(i:Int, sum:Int) : Bool {
			if (i == n) {
				return (sum == n);
			} else if (n % i == 0) {
				return _loop(i+1, sum+i);
			} else {
				return _loop(i+1, sum);
			}
		}
		
		return _loop(1, 0);
	}

	// returns an array of perfect numbers until given limit
	public static function perfectNumbers(n:Int) : Array<Int> {

		var pn = [ for (i in 1...n) if (isPerfect(i)) i ];
		return pn;
	}
}

