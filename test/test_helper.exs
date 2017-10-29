ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(MasteryBackend.Repo, :manual)

defmodule TestExtra do
  def deconstruct(bool) when is_boolean(bool), do: bool
  def deconstruct(number) when is_number(number), do: number
  def deconstruct(string) when is_binary(string), do: string
  def deconstruct(struct) when is_map(struct) do
    struct
    |> Map.delete(:__struct__)
    |> Enum.reduce(%{}, fn({k,v}, acc) -> Map.put(acc, Atom.to_string(k), v) end)
  end
  def deconstruct(list) when is_list(list) do
    Enum.map(list, &deconstruct/1)
  end
end

