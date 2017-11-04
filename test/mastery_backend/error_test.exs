defmodule MasteryBackend.ErrorTests do
  use ExUnit.Case

  alias MasteryBackend.Error

  test "can chain two errors" do
    first = %Error{error: :foo, message: "first"}

    second = Error.chain(first, :bar, "second")

    assert %Error{error: :bar, message: "second", cause: first} == second
  end


  test "does not chain the same error" do
    first = %Error{error: :foo, message: "first"}

    second = Error.chain(first, :foo, "second")

    assert %Error{error: :foo, message: "first"} == second
  end

  test "does not need a message" do
    first = %Error{error: :foo}

    second = Error.chain(first, :foo)

    assert %Error{error: :foo} == second
  end
end
