defmodule SodisTest do
  use ExUnit.Case
  doctest Sodis

  test "greets the world" do
    assert Sodis.hello() == :world
  end
end
