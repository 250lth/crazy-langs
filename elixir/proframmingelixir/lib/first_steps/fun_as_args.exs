times_2 = fn n -> n * 2 end
apply = fn (fun, value) -> fun.(value) end
apply.(times_2, 6) |> IO.puts

list = [1, 3, 5, 7, 9]
Enum.map list, fn elem -> elem * 2 end
Enum.map list, fn elem -> elem * elem end
Enum.map list, fn elem -> elem > 6 end

add_one = &(&1 + 1)
add_one.(44) |> IO.puts
square = &(&1 * &1)
square.(8) |> IO.puts
speak = &(IO.puts(&1))
speak.("Hello")

rnd = &(Float.round(&1, &2))
rnd = &(Float.round(&2, &1))

divrem = &{ div(&1, &2), rem(&1, &2) }
divrem.(13, 5)

l = &length/1
l.([1,3,5,7,9]) |> IO.puts

len = &Enum.count/1
len.([1,2,3,4]) |> IO.puts

m = &Kernel.min/2
m.(99, 88) |> IO.puts