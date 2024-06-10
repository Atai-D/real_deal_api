defmodule RealDealApi.Responses.Response do
  use Ecto.Schema
  import Ecto.Changeset

  @optional_fields []
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "responses" do
    belongs_to :owner, RealDealApi.Users.User
    belongs_to :task, RealDealApi.Tasks.Task

    timestamps()
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, all_fields())
    |> validate_required([:owner_id, :task_id])
  end
end
