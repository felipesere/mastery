defmodule MasteryBackend.Users do
  # token -> User

  def start_link do
    Agent.start_link(fn -> Map.new end, name: __MODULE__)
  end

  def save(token, user) do
    Agent.update(__MODULE__, fn(state) -> Map.put(state, token, user) end)
  end

  def find(token) do
    Agent.get(__MODULE__, &(&1))
    |> Enum.find(fn({key, _}) -> key == token end)
    |> extract()
  end

  defp extract(nil), do: :not_found
  defp extract({_, value}), do: value
end
