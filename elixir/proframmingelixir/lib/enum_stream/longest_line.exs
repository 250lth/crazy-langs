IO.puts File.read!("/usr/share/dict/words")
  |> String.split
  |> Enum.max_by(&String.length/1)

[1,2,3,4]
|> Stream.map(&(&1*&1))
|> Stream.map(&(&1+1))
|> Stream.filter(fn x -> rem(x, 2) == 1 end)
|> Enum.to_list
|> IO.inspect

IO.puts File.open!("/usr/share/dict/words")
|> IO.stream(:line)
|> Enum.max_by(&String.length/1)

IO.puts File.stream!("/usr/share/dict/words")
|> Enum.max_by(&String.length/1)