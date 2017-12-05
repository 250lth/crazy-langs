defmodule GuardianSampleTest do
  use ExUnit.Case
  doctest GuardianSample

  test "greets the world" do
    assert GuardianSample.hello() == :world
  end
end
