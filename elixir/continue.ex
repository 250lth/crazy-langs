defmodule Continue do
  use GenServer

  require Logger

  def start_link do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  @impl true
  def init(state) do
    send(self(), :inc_and_log)
    send(self(), :inc_and_log)
    send(self(), :inc_and_log)

    Logger.info fn -> "INIT" end

    {:ok, state}
  end

  @impl true
  def handle_info(:inc_and_log, state) do
    new_state = state + 1

    Logger.info fn -> "HANDLE INFO; STATE: #{state}" end

    {:noreply, new_state, {:continue, :inc_one_more_time}}
  end

  def handle_continue(:inc_one_more_time, state) do
    {:noreply, state + 1}
  end
end
