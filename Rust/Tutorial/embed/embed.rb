# embed.rb
# a threading for using rust code
# from ruby
#
# vim: ft=ruby sw=2 ts=2

require 'ffi'

module Hello
	extend FFI::Library
	ffi_lib 'target/release/libembed.so'
	attach_function :process, [], :void
end

Hello.process

puts "done!"

