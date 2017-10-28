defmodule FizzBuzz2 do
  @moduledoc false
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(n) do
    cond do
      rem(current, 3) == 0 and rem(current, 5) == 0 ->
        "FizzBuzz"
      rem(current, 3) == 0 ->
        "Fizz"
      rem(current, 5) == 0 ->
        "Buzz"
      true ->
        current
    end
  end

end
