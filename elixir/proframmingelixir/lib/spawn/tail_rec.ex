defmodule TailRec do
  @moduledoc false
  def factorial(n), do: _fact(n, 1)

  defp _fact(0, acc), do: acc

  defp _fact(n, acc), do: _fact(n-1, acc*n)

end
