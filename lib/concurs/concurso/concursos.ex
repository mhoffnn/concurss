defmodule Concurs.Concurso.Concursos do
  use Ecto.Schema
  import Ecto.Changeset

  schema "concurso" do
    field :descricao, :string
    field :nome, :string
    field :timestamp, :string

    timestamps()
  end

  @doc false
  def changeset(concursos, attrs) do
    concursos
    |> cast(attrs, [:nome, :descricao, :timestamp])
    |> validate_required([:nome, :descricao, :timestamp])
  end
end
