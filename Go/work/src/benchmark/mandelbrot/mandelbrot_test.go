// perfectnumber_test.go
//
// vim: ft=go sw=4 ts=4
//

package mandelbrot_test

import (
	. "benchmark/mandelbrot"
	"image"
	"image/color"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("Mandelbrot", func() {

	Context("PixelValue", func() {

		It("should return pixel values", func() {
			Ω(PixelValue(0, 0, 2.0, 255)).Should(Equal(0))
		})
	})

	Context("GetColor", func() {

		It("should return a color from an indexed palette", func() {
			Ω(GetColor(0)).Should(Equal(color.RGBA{0, 0, 0, 255}))
			Ω(GetColor(255)).Should(Equal(color.RGBA{255, 255, 255, 255}))
			Ω(func() { GetColor(256) }).Should(Panic())
		})
	})

	Context("Mandelbrot", func() {

		It("should return a mandelbrot set image", func() {
			img := Mandelbrot(180, 120, 0, -0.5, 4.0/180)

			Ω(*img).Should(BeAssignableToTypeOf(image.RGBA{}))
			Ω(img.Rect).Should(Equal(image.Rect(0, 0, 180, 120)))
		})
	})

	Context("MandelbrotAsync", func() {

		It("should return a channel of mandelbrot image", func() {
			mb := MandelbrotAsync(180, 120, 0, -0.5, 4.0/180)

			var img *image.RGBA
			Eventually(mb).Should(Receive(&img))
			Ω(img.Rect).Should(Equal(image.Rect(0, 0, 180, 120)))
		})
	})
})
