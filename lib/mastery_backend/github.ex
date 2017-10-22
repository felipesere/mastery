defmodule MasteryBackend.Github do

  defmodule User do
    defstruct [:name]
  end

  def exchange_for_token(code) do
    [client_id: client_id, client_secret: client_secret] = Application.get_env(:mastery_backend, :github)

    code
    |> payload(client_id, client_secret)
    |> send()
    |> parse()
  end

  defp payload(code, id, secret) do
    Poison.encode!(%{"client_id" => id, "client_secret" => secret, "code" => code})
  end

  defp send(payload) do
    HTTPoison.post('https://github.com/login/oauth/access_token?scope=user%20read:org', payload, [{"Content-Type", "application/json"}])
  end


  def user(token) do
    HTTPoison.get('https://api.github.com/user', ["Authorization": "Bearer #{token}"])
    |> parse_user()
  end

  defp parse_user({:ok, %{body: body}}) do
    Poison.decode!(body, as: %MasteryBackend.Github.User{})
  end
  defp parse_user(response) do
    {:error, response}
  end

  defp parse({:ok, %{body: body}}) do
    body
    |> String.split("&")
    |> Enum.map(&parse_token/1)
    |> Enum.filter(fn([key, _value]) -> key == "access_token" end)
    |> Enum.map(fn([_key, value]) -> value end)
    |> List.first()
  end
  defp parse(response), do: {:failed, response}

  def parse_token(token), do: String.split(token, "=")
end
