defmodule Sum do
  @moduledoc false
  def sum(0), do: 0
  def sum(n), do: sum(n-1) + n

end
