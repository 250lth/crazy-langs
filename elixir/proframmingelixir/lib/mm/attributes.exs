defmodule Example do
  @author "250LTH"
  def get_author do
    @author
  end
end

IO.puts "Example was written by #{Example.get_author}"

defmodule Example2 do
  @attr "one"
  def first, do: @attr

  @attr "two"
  def second, do: @attr
end

IO.puts "#{Example2.first} #{Example2.second}"