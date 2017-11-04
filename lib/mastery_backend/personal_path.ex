defmodule MasteryBackend.PersonalPath do
  defstruct [:todo, :current, :done]

  def new(lessons) do
    %__MODULE__{todo: lessons, done: []}
  end
end
