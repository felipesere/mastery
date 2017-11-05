defmodule MasteryBackend.PersonalPath do
  alias MasteryBackend.Error

  defstruct [:todo, :current, :done]
  use ExConstructor

  def cast(data) do
    if valid?(data) do
      __MODULE__.new(data)
    else
      %Error{error: :missing_data, message: inspect(data) }
    end
  end

  defp valid?(data) do
    Vex.valid?(data, %{"todo" => &is_list/1,
                       "done" => &is_list/1})
  end

  def todo(lessons) when is_list(lessons) do
    %__MODULE__{todo: lessons, done: []}
  end
end
