defmodule MasteryBackend.Paths do
  # user_id -> path
  #
  defmodule PersonalPath do
    defstruct [:todo, :current, :done]
  end

  def start_link do
    Agent.start_link(fn -> Map.new end, name: __MODULE__)
  end

  def upsert(%{id: id}, path) do
    IO.puts "Saved a path for #{id}"
    Agent.update(__MODULE__, &(Map.update(&1, id, path, fn(_) -> path end)))
  end

  def find(%{id: id}), do: find(id)
  def find(id) do
    Agent.get(__MODULE__, &(&1))
    |> Enum.find(fn({x,_}) -> x == id end)
  end
end
