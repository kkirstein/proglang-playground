// perfectnumber.go
//
// vim: ft=go sw=4 ts=4
//
// Calculating perfect numbers in Go
//

package mandelbrot

import (
	"image"
	"image/color"
	"image/color/palette"
	"image/png"
	"log"
	"math/cmplx"
	"os"
)

const (
	rMax     = 2.0
	maxValue = 256
)

// calculate picel value
func PixelValue(xCoord, yCoord, rMax float64, maxValue int) int {
	z0 := complex(xCoord, yCoord)
	z := complex(0, 0)

	for n := maxValue; n > 0; n-- {
		if cmplx.Abs(z) > rMax {
			return n
		}
		z = z*z + z0
	}

	return 0
}

// retrieve color
func GetColor(index int) color.Color {
	pal := palette.Plan9
	if index > len(pal) {
		return color.Black
	} else {
		return pal[index]
	}
}

// generate image data
func Mandelbrot(width, height int, xCenter, yCenter, pixelSize float64) *image.RGBA {
	img := image.NewRGBA(image.Rect(0, 0, width, height))
	xOffset := xCenter - 0.5*pixelSize*(float64(width)+1)
	yOffset := yCenter + 0.5*pixelSize*(float64(height)+1)

	for y := 0; y < height; y++ {
		for x := 0; x < width; x++ {
			xCoord := xOffset + float64(x)*pixelSize
			yCoord := yOffset - float64(y)*pixelSize
			img.Set(x, y, GetColor(PixelValue(xCoord, yCoord, rMax, maxValue)))
		}
	}
	return img
}

// write image as PNG
func WritePng(path string, img *image.RGBA) error {
	fid, err := os.Create(path)
	if err != nil {
		log.Panic(err)
	}
	defer fid.Close()

	err = png.Encode(fid, img)
	return err
}
