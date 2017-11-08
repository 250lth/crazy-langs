defmodule LineSigil do
  @moduledoc """
  Documentation for LineSigil.
  """

  @doc """
  Hello world.

  ## Examples

      iex> LineSigil.hello
      :world

  """
  def sigil_l(lines, _opts) do
    lines |> String.rstrip |> String.split("\n")
  end
end
