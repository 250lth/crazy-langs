defmodule Sequence.Server do
  @moduledoc false
  


  use GenServer

  #def start_link(state, opts) do
   # GenServer.start_link(__MODULE__, state, opts)
  #end

  #def init(_opts) do
   # {:ok, %{}}
  #end

  def handle_call(:next_number, _from, current_number) do
    { :reply, current_number, current_number + 1 }
  end

  #def handle_cast(_msg, state) do
   # {:noreply, state}
  #end
end