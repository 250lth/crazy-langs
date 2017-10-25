defmodule MyList do
  @moduledoc false
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head|tail]), do: [ head * head | square(tail)]

  def add1([]), do: []
  def add1([ head | tail]), do: [ head + 1 | add1(tail)]

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