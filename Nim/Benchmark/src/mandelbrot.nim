# mandelbrot_colormap.nim
# color map for mandelbrot sets
#
# vim: ft=nim sw=4 ts=4 et
#

import complex

#from mandelbrot_colormap as cm import nil
import mandelbrot_colormap

# global defs
const r_max : float = 2.0

# calculate pixel color
proc pixel* (x, y : float) : Color =
    let z0 : Complex = (re: x, im: y)
    var z : Complex = (re: 0.0, im: 0.0)

    for n in 0 .. <n_max:
        z = z * z + z0
        if z.abs() > r_max: return color_map[n+1]

    return Black

# generate Mandelbrot set
proc mandelbrot* (x_max : int, y_max : int, x_center : float, y_center : float, pixel_size : float,
                    image : var openArray[Color]) : bool =

    # TODO: check image size
    result = false

    let
        x_offset : float = x_center - 0.5 * pixel_size * float(x_max + 1)
        y_offset : float = y_center + 0.5 * pixel_size * float(y_max + 1)

    for y in 1 .. <y_max:
        for x in 1 .. <x_max:
            let
                x_coord : float = x_offset + float(x) * pixel_size
                y_coord : float = y_offset - float(y) * pixel_size
            image[y*x_max + x - 1] = pixel(x_coord , y_coord)

    result = true


# write image data as PGM file
proc write_pgm* (file_name : string, image : openArray[Color], width : int, height : int) : bool =

    # TODO: check image size
    result = false
    
    let file = open(file_name, mode = fmWrite)

    # write header
    file.writeln("P3")
    file.writeln(width)
    file.writeln(height)
    file.writeln(255)

    # write pixel
    for pix in image:
        file.writeln(pix.toString())

    # close file
    close(file)
    result = true

