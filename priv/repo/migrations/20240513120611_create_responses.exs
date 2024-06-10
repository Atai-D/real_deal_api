defmodule RealDealApi.Repo.Migrations.CreateResponses do
  use Ecto.Migration

  def change do
    create table(:responses, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :owner_id, references(:users, type: :binary_id, on_delete: :nothing), null: false

      add :task_id, references(:tasks, type: :binary_id, on_delete: :nothing), null: false
      timestamps()
    end
  end
end
