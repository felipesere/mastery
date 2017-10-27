defmodule MasteryBackend.Users do
  # token -> User

  def start_link do
    Agent.start_link(fn -> Map.new end, name: __MODULE__)
  end

  def save(user) do
    Agent.update(__MODULE__, fn(state) -> Map.put(state, user.id, user) end)
    user
  end

  def find(id) do
    Agent.get(__MODULE__, &(&1))
    |> Enum.find({:not_found, id}, fn({key, _}) -> key == id end)
  end
end
