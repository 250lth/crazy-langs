prefix = fn pre -> (fn str -> "#{pre} #{str}" end) end

mrs = prefix.("Mrs")
mrs.("Smith") |> IO.puts
prefix.("Elixir").("Amazing") |> IO.puts
