defmodule MasteryBackend.Github.Client do
  def start_link do
    config = Application.get_env(:mastery_backend, :github)
    Agent.start_link(fn -> Enum.into(config, %{}) end, name: __MODULE__)
  end

  def raw_token!(code) do
    payload = payload(code)
    HTTPoison.post('https://github.com/login/oauth/access_token?scope=user%20read:org', payload, [{"Content-Type", "application/json"}])
  end

  def raw_user!(token) do
    HTTPoison.get('https://api.github.com/user', ["Authorization": "Bearer #{token}"])
  end

  defp payload(code) do
    %{client_id: id, client_secret: secret} = Agent.get(__MODULE__, &(&1))
    Poison.encode!(%{"client_id" => id, "client_secret" => secret, "code" => code})
  end

  def authorization_url() do
    %{client_id: client_id} = Agent.get(__MODULE__, &(&1))

    "https://github.com/login/oauth/authorize?client_id=#{client_id}&scope=user%20read:org"
  end
end
