# vim: ft=ruby sw=2 ts=2
#
require 'minitest/autorun'

require_relative '../lib/Benchmark/perfect_number.rb'

include Benchmark

describe PerfectNumber, 'Calculate perfect numbers' do
  it 'predicate should give correct results' do
    _(PerfectNumber.perfect?(1)).must_equal false
    _(PerfectNumber.perfect?(2)).must_equal false
    _(PerfectNumber.perfect?(3)).must_equal false
    _(PerfectNumber.perfect?(4)).must_equal false
    _(PerfectNumber.perfect?(5)).must_equal false
    _(PerfectNumber.perfect?(6)).must_equal true
    _(PerfectNumber.perfect?(7)).must_equal false
    _(PerfectNumber.perfect?(28)).must_equal true
  end

  it 'should list perfect numbers' do
    _(PerfectNumber.perfect_numbers(1000)).must_equal [6, 28, 496]
  end
end
