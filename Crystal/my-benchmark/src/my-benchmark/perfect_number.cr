# vim: ft=crystal ts=2 sw=2
#
# perfect_number.cr
# Implementation of perfect numbers in the Crystal programming language
# https://www.crystal-lang.org
#

module MyBenchmark
  module PerfectNumber
    extend self

    # predicate to check for perfect numbers
    def perfect?(n)
      sum = 0
      1.upto(n - 1) do |i|
        sum += i if (n % i) == 0
      end
      sum == n
    end

    # generates an array of perfect numbers up to given upper bound
    def perfect_numbers(n)
      (1..n).select { |i| perfect? i }
    end
  end
end
