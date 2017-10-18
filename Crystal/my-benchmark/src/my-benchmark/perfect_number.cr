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

    # generates an array of perfect numbers up to given upper bound
		# (asynchronous version with a channel for results)
    def perfect_numbers_2(n)
      chan = Channel({Int32, Bool}).new

      1.upto(n + 1) do |i|
        spawn do
          if perfect?(i)
            chan.send({i, true})
          else
            chan.send({i, false})
          end
        end
      end

      pn = Array(Int32).new

      n.times do
        idx, res = chan.receive
        pn << idx if res
      end

      pn
    end
  end
end
