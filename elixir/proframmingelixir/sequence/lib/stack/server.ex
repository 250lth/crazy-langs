defmodule Stack.Server do
  @moduledoc false
  


  use GenServer

  ####
  ## APIs

  def start_link(current_stack) do
    GenServer.start_link(__MODULE__, current_stack, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(element) do
    GenServer.cast(__MODULE__, { :push, element })
  end

  ####
  # GenServer implementation

  def handle_call(:pop, _from, [ head | tail ]) do
    { :reply, head, tail }
  end

  def handle_cast({:push, new_element}, current_stack) do
    new_list = List.insert_at(current_stack, 0, new_element)

    { :noreply, new_list }
  end

  def terminate(reason, state) do
    IO.puts "reason: #{inspect reason}\n
              state: #{inspect state}"
  end

end