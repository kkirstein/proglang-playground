# vim: ft=crystal ts=2 sw=2
#
# spec for Module Benchmark/Mandelbrot

require "../spec_helper"

include MyBenchmark::Mandelbrot

describe "Mandelbrot" do
  it "mandelbrot should return an array of rgb pixel values" do
    mandel_set = Mandelbrot.new(640, 480, 0.0, 0.0, 0.5)
    mandel_set.width.must_equal 640
    mandel_set.height.must_equal 480
  end

  it "should write image data to a PPM file" do
    mandel_set = Mandelbrot.new(640, 480, -0.5, 0.0, 4.0 / 640)
    file_name = "./test_data/mandelbrot.ppm"
    File.delete file_name if File.exist? file_name
    mandel_set.to_ppm(file_name)
    File.exist?(file_name).must_equal true
  end
end
