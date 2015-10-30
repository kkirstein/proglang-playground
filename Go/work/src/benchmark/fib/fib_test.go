// fib_test.go
// 
// vim: ft=go sw=4 ts=4
//

package fib

import (
	"testing"
)

func TestFibNaive(t *testing.T) {
	switch {
		case FibNaive(0) != 0: { t.Error("fib(0) must be 0") }
		case FibNaive(1) != 1: { t.Error("fib(1) must be 1") }
		case FibNaive(2) != 1: { t.Error("fib(2) must be 1") }
		case FibNaive(3) != 2: { t.Error("fib(3) must be 2") }
		case FibNaive(35) != 9227465: { t.Error("fib(0) must be 9227465") }
	}
}

func TestFib(t *testing.T) {
	switch {
		case Fib(0).String() != "0": { t.Error("fib(0) must be 0") }
		case Fib(1).String() != "1": { t.Error("fib(1) must be 1") }
		case Fib(2).String() != "1": { t.Error("fib(2) must be 1") }
		case Fib(3).String() != "2": { t.Error("fib(3) must be 2") }
		case Fib(35).String() != "9227465": { t.Error("fib(35) must be 9227465") }
	}
}

