# vim: ft=crystal ts=2 sw=2
#
# spec for Module Benchmark/Mandelbrot

require "../spec_helper"

include MyBenchmark::Mandelbrot

describe "Mandelbrot" do
  it "mandelbrot should return an array of rgb pixel values" do
		mandel_set = Image.new(640, 480, -0.5f32, 0.0f32, 4.0f32 / 640)
    mandel_set.width.should eq 640
    mandel_set.height.should eq 480
  end

  it "should write image data to a PPM file" do
		mandel_set = Image.new(640, 480, -0.5f32, 0.0f32, 4.0f32 / 640)
    file_name = "./test_data/mandelbrot.ppm"
    File.delete file_name if File.exists? file_name
    mandel_set.to_ppm(file_name)
    File.exists?(file_name).should be_true
  end
end
