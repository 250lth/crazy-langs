defmodule EasyTest do
  use ExUnit.Case
  doctest Easy

  test "greets the world" do
    assert Easy.hello() == :world
  end
end
