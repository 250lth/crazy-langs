defmodule Dictionary do

  @name __MODULE__

  def start_link do
    Agent.start_link(fn -> Map.new end, name: @name)
  end

  def add_words(words) do
    Agent.update(@name, &do_add_words(&1, words))
  end

  def anagrams_of(word) do
    Agent.get(@name, &Map.get(&1, signature_of(word)))
  end

  defp do_add_words(dict, words) do
    Enum.reduce(words, dict, &add_one_word(&1, &2))
  end

  defp add_one_word(word, dict) do
    Map.update(dict, signature_of(word), [word], &[word|&1])
  end

  defp signature_of(word) do
    word
    |> to_charlist
    |> Enum.sort
    |> to_string
  end
end


defmodule WordlistLoader do
  def load_from_files(file_names) do
    file_names
    |> Stream.map(fn name -> Task.async(fn -> load_task(name) end) end)
    |> Enum.map(&Task.await/1)
  end

  defp load_task(file_name) do
    File.stream!(file_name, [], :line)
    |> Enum.map(&String.trim/1)
    |> Dictionary.add_words
  end
end