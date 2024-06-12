defmodule RealDealApi.Accounts do
  import Ecto.Query, warn: false
  alias RealDealApi.Repo

  alias RealDealApi.Accounts.Account

  def list_accounts do
    Repo.all(Account)
  end

  def get_account!(id), do: Repo.get!(Account, id)

  def get_full_account(id) do
    Account
    |> where(id: ^id)
    |> preload([:user])
    |> Repo.one()
  end

  def get_account_by_email(email) do
    Account
    |> where(email: ^email)
    |> Repo.one()
  end

  def create_account(attrs \\ %{}) do
    %Account{}
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  def update_account(%Account{} = account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  def delete_account(%Account{} = account) do
    Repo.delete(account)
  end

  def change_account(%Account{} = account, attrs \\ %{}) do
    Account.changeset(account, attrs)
  end
end
