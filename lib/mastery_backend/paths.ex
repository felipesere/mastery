defmodule MasteryBackend.Paths do
  alias MasteryBackend.PersonalPath
  alias MasteryBackend.Error

  def start_link do
    Agent.start_link(fn -> Map.new end, name: __MODULE__)
  end

  def save(%{id: id}, %PersonalPath{} = path) do
    Agent.update(__MODULE__, fn(state) -> Map.put(state, id, path) end)
    path
  end

  def find(%{id: id}), do: find(id)
  def find(id) do
    Agent.get(__MODULE__, &(&1))
    |> Map.get(id, %Error{error: :path_not_found, message: "Path for user #{id} not found"})
  end
end
