defmodule Concurs.Incricao.Inscricoes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inscricao" do
    field :descricao, :string
    field :timestamp, :string
    field :votos, :integer
    field :id_usuario, :id
    field :id_concurso, :id

    timestamps()
  end

  @doc false
  def changeset(inscricoes, attrs) do
    inscricoes
    |> cast(attrs, [:votos, :descricao, :timestamp])
    |> validate_required([:votos, :descricao, :timestamp])
  end
end
