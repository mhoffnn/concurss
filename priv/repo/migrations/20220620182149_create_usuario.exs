defmodule Concurs.Repo.Migrations.CreateUsuario do
  use Ecto.Migration

  def change do
    create table(:usuario) do
      add :nome, :string
      add :idade, :integer
      add :email, :string
      add :senha, :uuid
      add :timestamp, :string

      timestamps()
    end

  end
end
