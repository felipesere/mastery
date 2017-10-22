defmodule MasteryBackend.Github.LocalClient do

  def start_link do
    {:ok, spawn fn -> 1 end}
  end

  def raw_token!(_code) do
    {:ok, %{body: "access_token=fake_token&scope=read%3Aorg%2Cuser&token_type=bearer"}}
  end

  def raw_user!(_token) do
    {:ok, %{body: "{\"name\":\"Ron Swanson\", \"id\": 1}"}}
  end

  def authorization_url() do
    Application.get_env(:mastery_backend, :github)[:auth_url]
  end
end
