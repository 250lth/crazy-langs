defmodule Stack.Server do
  @moduledoc false
  


  use GenServer

  def handle_call(:pop, _from, [ head | tail ]) do
    { :reply, head, tail }
  end

  def handle_cast({:push, new_element}, current_stack) do
    new_list = List.insert_at(current_stack, 0, new_element)

    { :noreply, new_list }
  end

end