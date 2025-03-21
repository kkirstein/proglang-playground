# vim: ft=crystal ts=2 sw=2
#
# mandelbrot.cr
# Implementation of Mandelbrot sets in the Crystal programming language
# https://www.crystal-lang.org
#

require "complex"
require "stumpy_png"

module MyBenchmark
  module Mandelbrot
    include StumpyPNG

    class Image
      # class constants
      R_MAX = 2.0
      N_MAX = 255

      getter :width
      getter :height

      # generates Mandelbrot set for the given coordinates
      def initialize(@width : Int32, @height : Int32,
                     x_center : Float32, y_center : Float32, pixel_size : Float32)
        x_offset = x_center - 0.5 * pixel_size * @width
        y_offset = y_center + 0.5 * pixel_size * @height

        @image_data = Canvas.new(@width, @height) do |x, y|
          RGBA.from_rgb(*to_rgb(pixel_value(x * pixel_size + x_offset, y * pixel_size - y_offset)))
        end
      end

      # calculates pixel value
      def pixel_value(x : Number, y : Number)
        n = 0
        z = Complex.zero
        z0 = Complex.new(x, y)
        while z.abs < R_MAX && n < N_MAX
          z = z * z + z0
          n += 1
        end
        n
      end

      # converts pixel value to RGB
      def to_rgb(value)
        {(5 * (value % 15)).to_u8, (32 * (value % 7)).to_u8, (8 * (value % 31)).to_u8}
      end

      # writes image data to PPM file
      def to_ppm(file_name : String)
        File.open(file_name, "w") do |file|
          file << "P3\n" << "#{@width} #{@height} 3\n"
          @image_data.pixels.each do |pix|
            rgb = pix.to_rgb8
            file << "#{rgb[0]} #{rgb[1]} #{rgb[2]}\n"
          end
        end
      end

      # writes imaeg data to PNG file
      def to_png(file_name : String)
        StumpyPNG.write(@image_data, file_name)
      end
    end

    # async variant of Mandelbrot Image
    class ImageAsync < Image

			@x_offset : Float32
			@y_offset : Float32
      # overwrite constructor
      def initialize(@width : Int32, @height : Int32,
                     x_center : Float32, y_center : Float32, @pixel_size : Float32)
        @x_offset = x_center - 0.5 * pixel_size * @width
        @y_offset = y_center + 0.5 * pixel_size * @height

        @image_data = Canvas.new(@width, @height)

				chan = Channel({Int32, Int32, RGBA}).new

				# spawn pixel generation
				0.upto(@height) do |y|
					0.upto(@width) do |x|
						spawn do
							chan.send generate_pixel(x, y)
						end
					end
				end

				# receive pixel values
				(@width*@height).times do
					x, y, pix = chan.receive
					@image_data[x, y] = pix
				end
      end

      # generate single line of image
      def generate_pixel(x : Int32, y : Int32)
				{x, y, RGBA.from_rgb(*to_rgb(pixel_value(x * @pixel_size + @x_offset, y * @pixel_size - @y_offset)))}
      end
    end
  end
end
