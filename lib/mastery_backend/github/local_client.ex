defmodule MasteryBackend.Github.LocalClient do

  def start_link do
    {:ok, spawn fn -> 1 end}
  end

  def raw_token!(code) do
    {:ok, %{body: "access_token=fake_token&scope=read%3Aorg%2Cuser&token_type=bearer"}}
  end

  def raw_user!(token) do
    {:ok, %{body: "{\"name\":\"Fake Person\"}"}}
  end

  def authorization_url() do
    "https://path2mastery.eu.ngrok.io/api/authorization/callback?code=ABC"
  end
end
