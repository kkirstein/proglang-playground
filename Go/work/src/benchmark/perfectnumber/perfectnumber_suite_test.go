package perfectnumber_test

import (
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"

	"testing"
)

func TestPerfectnumber(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "Perfectnumber Suite")
}
