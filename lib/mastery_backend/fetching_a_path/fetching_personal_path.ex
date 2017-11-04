defmodule MasteryBackend.FetchingAPath.FetchingPersonalPath do
  alias MasteryBackend.Users
  alias MasteryBackend.Paths
  alias MasteryBackend.Github.User
  alias MasteryBackend.PersonalPath

  alias MasteryBackend.Error

  def execute(user_id) do
    with %User{} <- Users.find(user_id),
         path = %PersonalPath{} <- Paths.find(user_id)
    do
      {:ok, path}
    else
      e -> Error.chain(e, :path_not_found)
    end
  end
end
