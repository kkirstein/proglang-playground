// perfectnumber_test.go
//
// vim: ft=go sw=4 ts=4
//

package perfectnumber

import "testing"

func TestIsPerfect(t *testing.T) {
	switch {
	case IsPerfect(1):
		t.Error("1 is no perfect number")
	case IsPerfect(2):
		t.Error("2 is no perfect number")
	case IsPerfect(3):
		t.Error("3 is no perfect number")
	case IsPerfect(4):
		t.Error("4 is no perfect number")
	case IsPerfect(5):
		t.Error("5 is no perfect number")
	case !IsPerfect(6):
		t.Error("6 is perfect number")
	case IsPerfect(7):
		t.Error("7 is no perfect number")
	}
}

func TestPerfectNumbers(t *testing.T) {
	pn := PerfectNumbers(1000)
	exp := []int{6, 28, 496}
	if len(pn) != len(exp) {
		t.Error("Wrong number of perfect numbers")
	}
	for i, v := range pn {
		if v != exp[i] {
			t.Errorf("Wrong perfect number, expected %d, actual: %d", exp[i], v)
		}
	}
}
