defmodule RealDealApi.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tasks" do
    field :category, :string
    field :description, :string
    field :title, :string
    field :created_at, :integer
    field :period_start, :integer
    field :period_end, :integer
    field :address, :string
    field :budget, :integer
    field :status, Ecto.Enum, values: [:new, :completed, :canceled, :in_progress], default: :new

    has_many :responses, RealDealApi.Responses.Response

    belongs_to :specialist, RealDealApi.Users.User, foreign_key: :specialist_id
    belongs_to :customer, RealDealApi.Users.User, foreign_key: :customer_id

    timestamps()
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, all_fields())
    |> validate_required([])
  end

  def create_changeset(task, attrs) do
    task
    |> cast(attrs, all_fields())
    |> validate_required([
      :category,
      :title,
      :address,
      :budget
      # :customer_id
    ])
  end
end
