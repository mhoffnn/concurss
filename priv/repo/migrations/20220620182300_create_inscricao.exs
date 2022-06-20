defmodule Concurs.Repo.Migrations.CreateInscricao do
  use Ecto.Migration

  def change do
    create table(:inscricao) do
      add :votos, :integer
      add :descricao, :string
      add :timestamp, :string
      add :id_usuario, references(:usuario, on_delete: :nothing)
      add :id_concurso, references(:concurso, on_delete: :nothing)

      timestamps()
    end

    create index(:inscricao, [:id_usuario])
    create index(:inscricao, [:id_concurso])
  end
end
