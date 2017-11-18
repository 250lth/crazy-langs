defmodule Metex do
  @moduledoc """
  Documentation for Metex.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Metex.hello
      :world

  """

  def temperatures_of(cities) do
    coordinator_pid =
      spawn(Metex.Coordinator, :loop, [[], Enum.count(cities)])

    cities |> Enum.each(fn city ->
      worker_pid = spawn(Metex.Worker, :loop, [])
      send worker_pid, {coorinator_pid, city}
    end)
  end

  def hello do
    :world
  end
end
