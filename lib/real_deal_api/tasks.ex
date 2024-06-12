defmodule RealDealApi.Tasks do
  import Ecto.Query, warn: false
  alias RealDealApi.Repo
  alias RealDealApi.Responses.Response
  alias RealDealApi.Tasks.Task

  def list_tasks do
    Repo.all(Task)
  end

  def get_task!(id), do: Repo.get!(Task, id)

  def create_task(attrs \\ %{}) do
    attrs =
      attrs
      |> Map.put("created_at", :os.system_time(:millisecond))

    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  def change_task(%Task{} = task, attrs \\ %{}) do
    Task.changeset(task, attrs)
  end

  def add_response(task_id, owner_id) when is_binary(task_id) and is_binary(owner_id) do
    %Response{}
    |> Response.changeset(%{task_id: task_id, owner_id: owner_id})
    |> Repo.insert()
  end
end
