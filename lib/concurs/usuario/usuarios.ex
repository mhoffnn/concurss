defmodule Concurs.Usuario.Usuarios do
  use Ecto.Schema
  import Ecto.Changeset

  schema "usuario" do
    field :email, :string
    field :idade, :integer
    field :nome, :string
    field :senha, Ecto.UUID
    field :timestamp, :string

    timestamps()
  end

  @doc false
  def changeset(usuarios, attrs) do
    usuarios
    |> cast(attrs, [:nome, :idade, :email, :senha, :timestamp])
    |> validate_required([:nome, :idade, :email, :senha, :timestamp])
  end
end
