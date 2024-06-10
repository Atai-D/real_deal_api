defmodule RealDealApiWeb.TaskController do
  alias RealDealApi.Responses.Response
  use RealDealApiWeb, :controller

  alias RealDealApi.Tasks
  alias RealDealApi.Tasks.Task

  action_fallback RealDealApiWeb.FallbackController

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    render(conn, "index.json", tasks: tasks)
  end

  def create(conn, %{"task" => task_params}) do
    with {:ok, %Task{} = task} <- Tasks.create_task(task_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.task_path(conn, :show, task))
      |> render("show.json", task: task)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    render(conn, "show.json", task: task)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)

    with {:ok, %Task{} = task} <- Tasks.update_task(task, task_params) do
      render(conn, "show.json", task: task)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)

    with {:ok, %Task{}} <- Tasks.delete_task(task) do
      send_resp(conn, :no_content, "")
    end
  end

  def add_response(conn, %{"task_id" => task_id, "owner_id" => owner_id}) do
    with {:ok, %Response{} = response} <- RealDealApi.Tasks.add_response(task_id, owner_id) do
      render(conn, "show.json", response: response)
    end
  end
end
