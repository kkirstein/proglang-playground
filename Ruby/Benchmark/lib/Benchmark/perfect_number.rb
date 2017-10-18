# perfect_number.rb ruby version to calculate perfect numbers
#
# vim: ft=ruby ts=2 sw=2
#

module Benchmark
  module PerfectNumber
    def self.perfect?(n)
      sum = 0
      1.upto(n - 1) do |i|
        sum += i if (n % i) == 0
      end
      sum == n
    end

    def self.perfect_numbers(n)
      (1..n).select { |i| perfect? i }
    end
  end
end
