defmodule Concurs.Repo.Migrations.CreateConcurso do
  use Ecto.Migration

  def change do
    create table(:concurso) do
      add :nome, :string
      add :descricao, :string
      add :timestamp, :string

      timestamps()
    end

  end
end
