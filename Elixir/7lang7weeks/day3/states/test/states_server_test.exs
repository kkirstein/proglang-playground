# vim: ft=elixir sw=2 ts=2
#
defmodule StatesServerTest do
  use ExUnit.Case

  test "add a single video" do
    assert GenServer.cast(:video_store, {:add, {:murmel, %Video{title: "Murmeltier"}}}) == :ok
  end

  test "rent a video" do
    assert GenServer.cast(:video_store, {:add, {:murmel, %Video{title: "Murmeltier"}}}) == :ok
    {id, %{title: t, times_rented: r, state: s}} = GenServer.call(:video_store, {:rent, :murmel})
  end


end

