defmodule MasteryBackend.Github do

  defmodule Token do
    defstruct [:access_token, :scopes, :type]

    def parse(content) do
      sections = URI.decode_query(content)
      %__MODULE__{access_token: sections["access_token"],
        scopes: scopes(sections),
        type: sections["token_type"]
      }
    end

    defp scopes(sections) do
      sections
      |> Map.get("scope", "")
      |> String.split(",")
    end
  end

  def authorization_url() do
    client().authorization_url()
  end

  def exchange_for_token(code) do
    code
    |> client().raw_token!()
    |> parse_token()
  end

  def user(%MasteryBackend.Github.Token{} = token) do
    token.access_token
    |> client().raw_user!()
    |> parse_user()
    |> add_token(token)
  end

  def add_token(user, token), do: %{ user | github_token: token}

  defp parse_user({:ok, %{body: body}}), do: MasteryBackend.Github.User.parse(body)
  defp parse_user(response), do: {:error, response}

  def parse_token({:ok, %{body: body}} ), do: MasteryBackend.Github.Token.parse(body)
  def parse_token(response), do: {:failed, response}


  def client() do
    :mastery_backend
    |> Application.get_env(:github)
    |> Keyword.get(:module)
  end
end
