# mandelbrot.rb
# Calculate Mandelbrot sets in Ruby

require 'complex'

module Benchmark

  class Mandelbrot
    # extend self
    attr_reader :width, :height

    # some constants
    R_MAX = 2.0
    N_MAX = 255

    # generate Mandelbrot set for the given coordinates
    def initialize(width, height, x_center, y_center, pixel_size)
      @width = width
      @height = height

      x_offset = x_center - 0.5 * pixel_size * width
      y_offset = y_center + 0.5 * pixel_size * height

      @image_data = Array.new(width * height) do |i|
        x = (i % width) * pixel_size + x_offset
        y = (i / width) * pixel_size - y_offset
        to_rgb(pixel_value(x, y))
      end
    end

    # calculate pixel value
    def pixel_value(x, y)
      n = 0
      z = Complex(0, 0)
      z0 = Complex(x, y)
      while z.abs < R_MAX && n < N_MAX
        z = z * z + z0
        n += 1
      end

      n
    end

    # convert pixel value to RGB
    def to_rgb(value)
      rgb = [5 * (value % 15), 32 * (value % 7), 8 * (value % 31)]

      rgb
    end

    # write image data to PPM file
    def to_ppm(file_name)
      File.open(file_name, 'w') do |file|
        file.write("P3\n")
        file.write("#{@width} #{@height} 3\n")
        @image_data.each do |pix|
          file.write("#{pix[0]} #{pix[1]} #{pix[2]}\n")
        end
      end
    end
  end
end
