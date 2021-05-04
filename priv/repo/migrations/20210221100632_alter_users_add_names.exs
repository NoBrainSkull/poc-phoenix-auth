defmodule PasswordFlow.Repo.Migrations.AlterUsersAddNames do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :firstname, :citext
      add :lastname, :citext
    end
  end
end
