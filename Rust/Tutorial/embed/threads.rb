# threads.rb
# a threading example in Ruby
#
# vim: ft=ruby sw=2 ts=2

threads = []

10.times do
	threads << Thread.new do
		count = 0

		5_000_000.times do
			count += 1
		end
	end
end

threads.each { |t| t.join }
puts "done!"

