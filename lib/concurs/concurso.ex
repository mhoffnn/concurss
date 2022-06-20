defmodule Concurs.Concurso do
  @moduledoc """
  The Concurso context.
  """

  import Ecto.Query, warn: false
  alias Concurs.Repo

  alias Concurs.Concurso.Concursos

  @doc """
  Returns the list of concurso.

  ## Examples

      iex> list_concurso()
      [%Concursos{}, ...]

  """
  def list_concurso do
    Repo.all(Concursos)
  end

  @doc """
  Gets a single concursos.

  Raises `Ecto.NoResultsError` if the Concursos does not exist.

  ## Examples

      iex> get_concursos!(123)
      %Concursos{}

      iex> get_concursos!(456)
      ** (Ecto.NoResultsError)

  """
  def get_concursos!(id), do: Repo.get!(Concursos, id)

  @doc """
  Creates a concursos.

  ## Examples

      iex> create_concursos(%{field: value})
      {:ok, %Concursos{}}

      iex> create_concursos(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_concursos(attrs \\ %{}) do
    %Concursos{}
    |> Concursos.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a concursos.

  ## Examples

      iex> update_concursos(concursos, %{field: new_value})
      {:ok, %Concursos{}}

      iex> update_concursos(concursos, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_concursos(%Concursos{} = concursos, attrs) do
    concursos
    |> Concursos.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a concursos.

  ## Examples

      iex> delete_concursos(concursos)
      {:ok, %Concursos{}}

      iex> delete_concursos(concursos)
      {:error, %Ecto.Changeset{}}

  """
  def delete_concursos(%Concursos{} = concursos) do
    Repo.delete(concursos)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking concursos changes.

  ## Examples

      iex> change_concursos(concursos)
      %Ecto.Changeset{source: %Concursos{}}

  """
  def change_concursos(%Concursos{} = concursos) do
    Concursos.changeset(concursos, %{})
  end
end
