defmodule DefaultParam1 do
  @moduledoc false
  def func(p1, p2 \\ 123) do
    IO.inspect [p1, p2]
  end

  def func(p1, p2) when is_list(p1) do
    "You said #{p2} with a list"
  end

  def func(p1, p2) do
    "You passed in #{p1} and #{p2}"
  end

end

IO.puts DefaultParam1.func(99)
IO.puts DefaultParam1.func(99, "cat")
IO.puts DefaultParam1.func([99])
IO.puts DefaultParam1.func([99], "dog")
