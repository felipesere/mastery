defmodule MasteryBackend.Github.User do
  defstruct [:name, :id, :github_token]

  def parse(content) do
    user = Poison.decode!(content, as: %__MODULE__{})
    %{ user | id: Integer.to_string(user.id) }
  end
end
