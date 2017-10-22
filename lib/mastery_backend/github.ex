defmodule MasteryBackend.Github do

  defmodule User do
    defstruct [:name]

    def parse(content), do: Poison.decode!(content, as: %__MODULE__{})
  end

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

  def exchange_for_token(code) do
    code
    |> MasteryBackend.Github.Client.raw_token!()
    |> parse_token()
  end

  def user(token) do
    token
    |> MasteryBackend.Github.Client.raw_user!()
    |> parse_user()
  end

  defp parse_user({:ok, %{body: body}}), do: MasteryBackend.Github.User.parse(body)
  defp parse_user(response), do: {:error, response}

  def parse_token({:ok, %{body: body}} ), do: MasteryBackend.Github.Token.parse(body)
  def parse_token(response), do: {:failed, response}
end
