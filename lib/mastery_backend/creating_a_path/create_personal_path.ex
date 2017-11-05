defmodule MasteryBackend.CreatingAPath.CreatePersonalPath do
  alias MasteryBackend.CreatingAPath.FetchLessons
  alias MasteryBackend.PersonalPath
  alias MasteryBackend.Paths
  alias MasteryBackend.Users

  def execute(user_id, %PersonalPath{todo: todo}) do
    user = Users.find(user_id)
    lessons = FetchLessons.fetch(todo)

    path = Paths.save(user, PersonalPath.todo(lessons))

    {:ok, path}
  end
end
