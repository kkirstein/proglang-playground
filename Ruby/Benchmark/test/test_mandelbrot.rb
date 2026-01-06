# vim: ft=ruby sw=2 ts=2
#
require 'minitest/autorun'

require_relative '../lib/Benchmark/mandelbrot.rb'

include Benchmark

describe Mandelbrot, 'Calculate Mandelbrot set' do
  it 'mandelbrot should return an array of rgb pixel values' do
    mandel_set = Mandelbrot.new(640, 480, 0.0, 0.0, 0.5)
    _(mandel_set.width).must_equal 640
    _(mandel_set.height).must_equal 480
  end

  it 'should write image data to a PPM file' do
    mandel_set = Mandelbrot.new(640, 480, -0.5, 0.0, 4.0 / 640)
    file_name = './test_data/mandelbrot.ppm'
    File.delete file_name if File.exist? file_name
    mandel_set.to_ppm(file_name)
    _(File.exist?(file_name)).must_equal true
  end
end
