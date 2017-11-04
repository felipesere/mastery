defmodule MasteryBackend.Users do
  alias MasteryBackend.Error

  def start_link do
    Agent.start_link(fn -> Map.new end, name: __MODULE__)
  end

  def save(user) do
    Agent.update(__MODULE__, fn(state) -> Map.put(state, user.id, user) end)
    user
  end

  def find(id) do
    Agent.get(__MODULE__, &(&1))
    |> Map.get(id, %Error{error: :user_not_found, message: "User #{id} not found"})
  end
end
