defmodule MasteryBackend.GithubTest do
  use ExUnit.Case
  alias MasteryBackend.Github

  test "parses an access token" do
    content = "access_token=e8b8&scope=read%3Aorg%2Cuser&token_type=bearer"
    result = Github.Token.parse(content)
    assert %Github.Token{access_token: "e8b8", scopes: ["read:org", "user"], type: "bearer"} == result
  end

  test "parses a user" do
    json = ~s"""
    { "name" : "Bob" }
    """
    assert %Github.User{name: "Bob"} == Github.User.parse(json)
  end

end
