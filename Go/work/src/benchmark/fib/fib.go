// fib.go
// 
// vim: ft=go sw=4 ts=4
//
// Calculating Fibonacci numbers in Go
//

package fib

import "math/big"

// naive recursive implementation
func FibNaive(n int) int {
	if (n < 2) {
		return n
	} else {
		return FibNaive(n-1) + FibNaive(n-2)
	}
}

// tco optimized version
func fibAux(n int, a, b *big.Int) *big.Int {
	if (n == 0) {
		return a
	} else {
		return fibAux(n-1, b, a.Add(a, b))
	}
}

func Fib(n int) *big.Int {
	return fibAux(n, big.NewInt(0), big.NewInt(1))
}

