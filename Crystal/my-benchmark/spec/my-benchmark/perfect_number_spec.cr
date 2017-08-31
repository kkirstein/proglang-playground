# vim: ft=crystal ts=2 sw=2
#
# spec for Module Benchmark/PerfectNumber

require "../spec_helper"

include MyBenchmark::PerfectNumber

describe "PerfectNumber" do
  it "predicat should give correct results" do
    perfect?(1).should be_false
    perfect?(2).should be_false
    perfect?(3).should be_false
    perfect?(5).should be_false
    perfect?(6).should be_true
    perfect?(7).should be_false
    perfect?(28).should be_true
  end

  it "should give the perfect numbers <= 1000" do
    perfect_numbers(1000).should eq [6, 28, 496]
  end
end
