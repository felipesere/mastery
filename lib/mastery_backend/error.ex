defmodule MasteryBackend.Error do
  defstruct [:error, :message, :cause]

  def chain(%__MODULE__{error: e} = error, e, _message) do
    error
  end
  def chain(%__MODULE__{} = error, e, message) do
    %__MODULE__{error: e, message: message, cause: error}
  end
  def chain(%__MODULE__{} = error, e) do
    %__MODULE__{error: e, cause: error}
  end
end
