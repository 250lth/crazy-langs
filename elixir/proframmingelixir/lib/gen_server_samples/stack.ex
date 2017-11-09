defmodule Stack do
  @moduledoc false
  


  use GenServer

  # Client APIs

  def start_link(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def push(pid, item) do
    GenServer.cast(pid, {:push, item})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # GenServer callbacks

  def handle_call(:pop, _from, [ h | t ]) do
    {:reply, h, t}
  end

  def handle_call(request, from, state) do
    super(request, from, state) # the default implementation from GenServer
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [ item | state ]}
  end

  def handle_cast(request, state) do
    super(request, state)
  end
end