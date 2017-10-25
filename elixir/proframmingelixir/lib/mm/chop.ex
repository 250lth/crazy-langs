defmodule Chop do
  @moduledoc false
  def guess(i, low..high) do
    g = div(low + high, 2)
    IO.puts "Is it #{g}"
    _guess(i, g, low..high)
  end

  defp _guess(i, i, _), do: IO.puts("Yes, it's #{i}")

  defp _guess(i, g, _..high) when g < i, do: guess(i, g + 1..high)

  defp _guess(i, g, low.._) when g > i, do: guess(i, low..g - 1)

end

Chop.guess(273, 1..1000)
