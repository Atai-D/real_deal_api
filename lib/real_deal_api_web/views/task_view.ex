defmodule RealDealApiWeb.TaskView do
  use RealDealApiWeb, :view
  alias RealDealApiWeb.TaskView

  def render("index.json", %{tasks: tasks}) do
    %{data: render_many(tasks, TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{data: render_one(task, TaskView, "task.json")}
  end

  def render("task.json", %{task: task}) do
    %{
      id: task.id,
      category: task.category,
      description: task.description,
      title: task.title,
      created_at: task.created_at,
      period_start: task.period_start,
      period_end: task.period_end,
      address: task.address,
      budget: task.budget,
      customer_id: task.customer_id,
      performer_id: task.performer_id,
      status: task.status
    }
  end

  def render("show.json", %{response: response}) do
    %{
      owner_id: response.owner_id,
      task_id: response.task_id
    }
  end
end
