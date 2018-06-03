defmodule Frequency do

  def start_link do
    Agent.start_link(fn -> Map.new end, name: __MODULE__)
  end

  def add_word(word) do
    Agent.update(
      __MODULE__,
      fn dict ->
        Map.update(dict, word, 1, &(&1 + 1))
      end)
  end

  def count_for(word) do
    Agent.get(__MODULE__, fn dict -> Map.get(dict, word) end)
  end

  def words do
    Agent.get(__MODULE__, fn dict -> Map.keys(dict) end)
  end
end
