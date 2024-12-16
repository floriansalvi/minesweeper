defmodule Minesweeper.UtilsTest do
  use ExUnit.Case, async: true

  alias Minesweeper.Utils

  defmodule TestServer do
    use GenServer

    @impl true
    def init(:ok), do: {:ok, :state}

    @impl true
    def init(:foo), do: {:stop, :foo}
  end

  test "start a singleton gen server" do
    assert {:ok, pid} = Utils.start_singleton_gen_server(TestServer, :ok)
    assert Utils.start_singleton_gen_server(TestServer, :ok) == {:ok, pid}
  end

  test "fail to start a singleton gen server" do
    pid = start_supervised!({Agent, fn -> nil end})
    Process.monitor(pid)

    try do
      Agent.update(pid, fn _ -> Utils.start_singleton_gen_server(TestServer, :foo) end)
    catch
      :exit, _e -> :ignore
    end

    assert_receive {:DOWN, _ref, :process, ^pid, :foo}
  end
end
