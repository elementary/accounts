defmodule FlatpakAuth.Repo.Migrations.CreateTokenTable do
  use Ecto.Migration

  def change do
    drop unique_index(:users, [:validation_code])

    alter table(:users) do
      remove :validation_code
    end

    rename table(:users), :validation_complete, to: :validated

    create table(:user_tokens, primary_key: false) do
      add :id, :uuid, primary_key: true

      add :type, :string, null: false

      add :user_id, references(:users), null: false

      add :expire_at, :utc_datetime, null: false
      timestamps()
    end
  end
end
