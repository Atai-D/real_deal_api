defmodule RealDealApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @optional_fields [:id, :biography, :full_name, :gender, :inserted_at, :updated_at]
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :biography, :string
    field :full_name, :string
    field :gender, :string
    field :skills, :string
    field :role, Ecto.Enum, values: [:performer, :customer]

    has_many :performer_tasks, RealDealApi.Tasks.Task, foreign_key: :performer_id
    has_many :customer_tasks, RealDealApi.Tasks.Task, foreign_key: :customer_id
    # field :photo

    timestamps()
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, all_fields())
    |> validate_required(all_fields() -- @optional_fields)
  end
end
