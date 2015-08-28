# vim: ft=elixir sw=2 ts=2
#
# video.ex
# struct definition for a video entity
#

defmodule Video do
  defstruct title: "", state: :available, times_rented: 0, log: []
end

