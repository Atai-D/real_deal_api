defmodule RealDealApi.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :category, :string, null: false
      add :description, :string
      add :title, :string, null: false
      add :status, :string, null: false
      add :created_at, :bigint
      add :period_start, :bigint
      add :period_end, :bigint
      add :address, :string
      add :budget, :integer

      add :performer_id, references(:users, type: :binary_id, on_delete: :nothing)

      add :customer_id, references(:users, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    # modify table(:tasks) do
    #   add_foreign_key(:performer_id, :users, on_delete: :delete_all)
    #   add_foreign_key(:customer_id, :users, on_delete: :delete_all)
    # end
  end
end
