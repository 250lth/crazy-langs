defmodule Stack.Server do
  @moduledoc false
  


  use GenServer

  def handle_call(:pop, _from, [ head | tail ]) do
    { :reply, head, tail }
  end

end