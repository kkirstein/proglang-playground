package mandelbrot_test

import (
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"

	"testing"
)

func TestMandelbrot(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "Mandelbrot Suite")
}
