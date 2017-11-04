defmodule MasteryBackend.FetchingAPath.FetchingPersonalPathTest do
  use ExUnit.Case
  alias MasteryBackend.Github.User
  alias MasteryBackend.Paths
  alias MasteryBackend.Users

  alias MasteryBackend.FetchingAPath.FetchingPersonalPath

  alias MasteryBackend.Error

  setup_all do
    :meck.new(Paths)
    :meck.new(Users)
    :ok
  end

  test "does not find path for user" do
    user_id = "12"
    :meck.expect(Users, :find, fn(_) -> %User{id: user_id} end)
    :meck.expect(Paths, :find, fn(user_id) -> %Error{error: :path_not_found, message: user_id} end)

    assert FetchingPersonalPath.execute(user_id).error == :path_not_found
  end

  test "does not find user" do
    user_id = "12"
    missing_user = %Error{error: :user_not_found, message: user_id}
    :meck.expect(Users, :find, fn(_) -> missing_user end)

    assert FetchingPersonalPath.execute(user_id).error == :path_not_found
  end
end
