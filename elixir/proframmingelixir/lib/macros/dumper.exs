defmodule My do

  defmacro macro(param) do
    IO.inspect param
  end

end

defmodule Test do

  require My

  My.macro :atom
  My.macro 1
  My.macro 1.0
  My.macro [1,2,3]
  My.macro "haha"
  My.macro { 1, 2 }
  My.macro do: 1
  My.macro do: 1

end

