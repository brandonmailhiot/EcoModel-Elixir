defmodule DiversityTest do
  use ExUnit.Case
  doctest Diversity

  test "calculate richness" do
    assert Diversity.richness([1,2,3,4,5]) == 5
  end

  test "calculate shannon index" do
    assert Diversity.shannon([1,2,3,4,5]) |> Float.floor(2) == Float.floor(1.4897503188505912, 2)
  end
end
