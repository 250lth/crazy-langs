fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, _, a -> a
end

IO.puts fizzbuzz.(0,0,0)
IO.puts fizzbuzz.(0,1,"a")
IO.puts fizzbuzz.(1,0,1)
IO.puts fizzbuzz.(1,1,1)
IO.puts fizzbuzz.("a",1,"a")

IO.puts "===================="

rem_fizzbuzz = fn n -> fizzbuzz.(rem(n, 3), rem(n, 5), n) end

IO.puts rem_fizzbuzz.(10)
IO.puts rem_fizzbuzz.(11)
IO.puts rem_fizzbuzz.(12)
