# vim: ft=elixir sw=2 ts=2
#
defmodule StatesServerTest do
  use ExUnit.Case

  test "add a single video" do
    assert GenServer.cast(:video_store, {:add, {:murmel, %Video{title: "Murmeltier"}}}) == :ok
  end

  test "rent a video" do
    assert GenServer.cast(:video_store, {:add, {:murmel, %Video{title: "Murmeltier"}}}) == :ok
    %{title: t, times_rented: r, state: s} = GenServer.call(:video_store, {:rent, :murmel})
    assert t == "Murmeltier"
    assert r == 1
    assert s == :rented
  end

  test "mutiple transitions" do
    assert GenServer.cast(:video_store, {:add, {:murmel, %Video{title: "Murmeltier"}}}) == :ok
    GenServer.call(:video_store, {:rent, :murmel})
    GenServer.call(:video_store, {:return, :murmel})
    GenServer.call(:video_store, {:rent, :murmel})
    GenServer.call(:video_store, {:return, :murmel})
    %{title: t, times_rented: r, state: s, log: l} = GenServer.call(:video_store, {:rent, :murmel})
    assert "Murmeltier" == t
    assert 3            == r
    assert :rented      == s
    assert 5            == Enum.count l
  end
end

