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

  def handle_cast({ :increment_number, delta }, current_number) do
    { :noreply, current_number + delta }
  end

  def format_status(_reason, [ _pdict, state ]) do
    [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]
  end

  ###
  # APIs
  def start_link(current_number) do
    GenServer.start_link(__MODULE__, current_number, name: __MODULE__)
  end

  def next_number do
    GenServer.call __MODULE__, :next_number
  end

  def increment_number(delta) do
    GenServer.cast __MODULE__, {:increment_number, delta}
  end

end