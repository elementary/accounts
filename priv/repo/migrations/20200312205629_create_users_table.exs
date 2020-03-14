defmodule Accounts.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false

      add :validation_code, :string
      add :validation_complete, :boolean

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:validation_code])
  end
end
