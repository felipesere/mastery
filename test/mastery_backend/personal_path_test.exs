defmodule MasteryBackend.PersonalPathTest do
  use ExUnit.Case
  alias MasteryBackend.PersonalPath

  test "valid data" do
    data = %{"todo" => [], "current" => nil, "done" => []}
    assert %PersonalPath{todo: [], current: nil, done: []} == PersonalPath.cast(data)
  end

  test "missing data" do
    assert PersonalPath.cast(%{}).error == :missing_data
  end
end
