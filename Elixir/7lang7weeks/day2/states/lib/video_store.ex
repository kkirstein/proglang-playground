# vim: ft=elixir sw=2 ts=2
#
# video_store.ex
# business logic for a video store
#

defmodule VideoStore do
  def renting(video) do
    vid = log video, "Renting #{video.title}"
    %{vid | times_rented: (video.times_rented + 1)}
  end

  def returning(video), do: log(video, "Returning #{video.title}")

  def losing(video), do: log(video, "Losing #{video.title}")

  def log(video, message) do
    %{video | log: [message|video.log]}
  end

end


