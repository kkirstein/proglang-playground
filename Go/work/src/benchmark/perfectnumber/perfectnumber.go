// perfectnumber.go
//
// vim: ft=go sw=4 ts=4
//
// Calculating perfect numbers in Go
//

package perfectnumber

import "sync"

// predicate to check for perfect numbers
func IsPerfect(n int) bool {
	sum := 0
	for i := 1; i < n; i++ {
		if n%i == 0 {
			sum += i
		}
	}
	return sum == n
}
func IsPerfectAsync(n int) <-chan bool {
	out := make(chan bool)

	go func() {
		defer close(out)
		out <- IsPerfect(n)
	}()

	return out
}

// list all perfect numbers for given limit
func PerfectNumbers(n int) []int {
	list := []int{}
	for i := 1; i < n; i++ {
		if IsPerfect(i) {
			list = append(list, i)
		}
	}
	return list
}
func PerfectNumbersAsync(n int) <-chan int {
	var wg sync.WaitGroup
	out := make(chan int)

	// start calculation
	wg.Add(n - 1)
	for i := 1; i < n; i++ {
		go func(x int) {
			defer wg.Done()
			if IsPerfect(x) {
				out <- x
			}
		}(i)
	}

	// close out channel when finished
	go func() {
		wg.Wait()
		close(out)
	}()

	return out
}
