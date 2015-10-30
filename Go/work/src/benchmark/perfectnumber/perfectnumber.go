// perfectnumber.go
// 
// vim: ft=go sw=4 ts=4
//
// Calculating perfect numbers in Go
//

package perfectnumber


// predicate to check for perfect numbers
func IsPerfect(n int) bool {
	sum := 0
	for i:=1; i<n; i++ {
		if n % i == 0 {
			sum += i
		}
	}
	return sum == n
}


// list all perfect numbers for given limit
func PerfectNumbers(n int) []int {
	list := []int{}
	for i:=1; i<n; i++ {
		if IsPerfect(i) {
			list = append(list, i)
		}
	}
	return list
}

