# vim: ft=elixir sw=2 ts=2
#
# states_server.ex
# a server implementation for the video store state machine
#

defmodule States.Server do
  use GenServer
  import VidStore

  def start_link(videos) do
    GenServer.start_link(__MODULE__, videos, name: :video_store)
  end

  def init(videos) do
    { :ok, videos }
  end

  @doc """
  Handle synchronous calls to the server, return an answer to the client.
  Applies the given VidStore action to the videos state.
  """
  def handle_call({action, item}, _from, videos) do
    video = videos[item]
    new_video = apply VidStore, action, [video]
    { :reply, new_video, Keyword.put(videos, item, new_video) }
  end

  @doc """
  Handle asynchronous calls to the server,
  at the moment just the event of adding a video to the state.
  """
  def handle_cast({:add, video}, videos) do
    { :noreply, [video | videos] }
  end
end

