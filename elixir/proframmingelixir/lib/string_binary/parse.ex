defmodule Parse do
  @moduledoc false
  def number([ ?- | tail ]), do: _number_digits(tail, 0) * -1
  def number([ ?+ | tail ]), do: _number_digits(tail, 0)
  def number(str), do: _number_digits(str, 0)

  defp _number_digits([], value), do: value
  defp _number_digits([ digit | tail ], value)
    when digit in '0123456789' do
      _number_digits(tail, value * 10 + digit - ?0)
  end
  defp _number_digits([ non_digit | _ ], _) do
    raise "Invalid digit '#{[non_digit]}"
  end

  def calculate(calc_str), do: _calctype(calc_str, 0)

  defp _calctype([], value), do: value
  defp _calctype([ digit | tail ], value) when digit in '0123456789' do
    _calctype(tail, value * 10 + digit - ?0)
  end
  defp _calctype([ ?- | tail ], value), do: value - _calctype(tail, 0)
  defp _calctype([ ?+ | tail ], value), do: value + _calctype(tail, 0)
  defp _calctype([ ?/ | tail ], value), do: value / _calctype(tail, 0)
  defp _calctype([ ?* | tail ], value), do: value * _calctype(tail, 0)
  defp _calctype([ ?\s | tail ], value), do: _calctype(tail, value)
  defp _calctype([ unexpected | _ ], _), do: raise "Invalid digit '#{[unexpected]}"

end
