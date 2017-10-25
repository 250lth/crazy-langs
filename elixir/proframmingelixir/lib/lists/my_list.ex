defmodule MyList do
  @moduledoc false
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head|tail]), do: [ head * head | square(tail)]

  def add1([]), do: []
  def add1([ head | tail]), do: [ head + 1 | add1(tail)]

  def map([], _func), do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

  def sum(list), do: _sum(list, 0)

  defp _sum([], total), do: total
  defp _sum([ head | tail ], total), do: _sum(tail, head + total)

  def sum2([]), do: 0
  def sum2([ head | tail ]), do: head + sum2(tail)

  def reduce([], value, _) do value end
  def reduce([ head | tail ], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def mapsum([], _), do: 0
  def mapsum([ head | tail ], f), do: f.(head) + mapsum(tail, f)

  def max([ x ]), do: x
  def max([ x, y | tail ]) when x > y, do: max([x | tail ])
  def max([ x, y | tail ]) when x <= y, do: max([ y | tail ])

  def caesar([], _n), do: []
  def caesar([ head | tail ], n) do
    [do_caesar(head, n) | caesar(tail, n)]
  end

  defp do_caesar(base, n) do
    ?a + rem(base - ?a + n, ?z - ?a + 1)
  end

  def span(from, to) when from > to and is_number(from) and is_number(to), do: []
  def span(from, to) when from <= to and is_number(from) and is_number(to), do: [from | span(from + 1, to)]

end

MyList.len([]) |> IO.puts
MyList.len([11,12,13,14,15]) |> IO.puts
MyList.len(["cat", "dog"]) |> IO.puts

IO.puts("==============================")

MyList.square([]) |> IO.inspect
MyList.square([1,2,3,4,5]) |> IO.inspect

IO.puts("==============================")

MyList.add1([]) |> IO.inspect
MyList.add1([1,2,3,4]) |> IO.inspect

IO.puts "================================="
MyList.map([1,2,3,4], fn (n) -> n * n end) |> IO.inspect
MyList.map([1,2,3,4], fn (n) -> n + 1 end) |> IO.inspect
MyList.map([1,2,3,4], fn (n) -> n > 2 end) |> IO.inspect
MyList.map([1,2,3,4], &(&1 + 1)) |> IO.inspect

IO.puts "==========================="
MyList.sum([1,2,3,4,5]) |> IO.inspect
MyList.sum2([1,2,3,4,5]) |> IO.inspect

IO.puts "=============================="
MyList.reduce([1,2,3,4,5], 0, &(&1 + &2)) |> IO.inspect
MyList.reduce([1,2,3,4,5], 1, &(&1 * &2)) |> IO.inspect

IO.puts "============================"
MyList.mapsum [1,2,3,4,5], &(&1 * &1) |> IO.inspect

IO.puts "============================"
MyList.max([3,2,4,1,5,6,2]) |> IO.inspect

IO.puts "============================"
MyList.caesar('haaevkemyr', 13) |> IO.inspect