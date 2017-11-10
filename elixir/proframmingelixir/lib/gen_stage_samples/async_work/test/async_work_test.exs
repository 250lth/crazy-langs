defmodule AsyncWorkTest do
  use ExUnit.Case
  doctest AsyncWork

  test "greets the world" do
    assert AsyncWork.hello() == :world
  end
end
