defmodule Strings do
  @moduledoc false
  def is_printable?(str) when is_list(str) == false,
    do: raise "Passed parameter not a list"
  def is_printable?([ head | _ ]) when head > ?~ or head < ?\s,
    do: false
  def is_printable?([ _ | tail ]),
    do: is_printable?(tail)
  def is_printable?([]), do: true

  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)



end
