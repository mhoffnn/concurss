defmodule Concurs.Incricao do
  @moduledoc """
  The Incricao context.
  """

  import Ecto.Query, warn: false
  alias Concurs.Repo

  alias Concurs.Incricao.Inscricoes

  @doc """
  Returns the list of inscricao.

  ## Examples

      iex> list_inscricao()
      [%Inscricoes{}, ...]

  """
  def list_inscricao do
    Repo.all(Inscricoes)
  end

  @doc """
  Gets a single inscricoes.

  Raises `Ecto.NoResultsError` if the Inscricoes does not exist.

  ## Examples

      iex> get_inscricoes!(123)
      %Inscricoes{}

      iex> get_inscricoes!(456)
      ** (Ecto.NoResultsError)

  """
  def get_inscricoes!(id), do: Repo.get!(Inscricoes, id)

  @doc """
  Creates a inscricoes.

  ## Examples

      iex> create_inscricoes(%{field: value})
      {:ok, %Inscricoes{}}

      iex> create_inscricoes(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_inscricoes(attrs \\ %{}) do
    %Inscricoes{}
    |> Inscricoes.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a inscricoes.

  ## Examples

      iex> update_inscricoes(inscricoes, %{field: new_value})
      {:ok, %Inscricoes{}}

      iex> update_inscricoes(inscricoes, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_inscricoes(%Inscricoes{} = inscricoes, attrs) do
    inscricoes
    |> Inscricoes.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a inscricoes.

  ## Examples

      iex> delete_inscricoes(inscricoes)
      {:ok, %Inscricoes{}}

      iex> delete_inscricoes(inscricoes)
      {:error, %Ecto.Changeset{}}

  """
  def delete_inscricoes(%Inscricoes{} = inscricoes) do
    Repo.delete(inscricoes)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking inscricoes changes.

  ## Examples

      iex> change_inscricoes(inscricoes)
      %Ecto.Changeset{source: %Inscricoes{}}

  """
  def change_inscricoes(%Inscricoes{} = inscricoes) do
    Inscricoes.changeset(inscricoes, %{})
  end
end
