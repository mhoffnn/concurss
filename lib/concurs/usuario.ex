defmodule Concurs.Usuario do
  @moduledoc """
  The Usuario context.
  """

  import Ecto.Query, warn: false
  alias Concurs.Repo

  alias Concurs.Usuario.Usuarios

  @doc """
  Returns the list of usuario.

  ## Examples

      iex> list_usuario()
      [%Usuarios{}, ...]

  """
  def list_usuario do
    Repo.all(Usuarios)
  end

  @doc """
  Gets a single usuarios.

  Raises `Ecto.NoResultsError` if the Usuarios does not exist.

  ## Examples

      iex> get_usuarios!(123)
      %Usuarios{}

      iex> get_usuarios!(456)
      ** (Ecto.NoResultsError)

  """
  def get_usuarios!(id), do: Repo.get!(Usuarios, id)

  @doc """
  Creates a usuarios.

  ## Examples

      iex> create_usuarios(%{field: value})
      {:ok, %Usuarios{}}

      iex> create_usuarios(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_usuarios(attrs \\ %{}) do
    %Usuarios{}
    |> Usuarios.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a usuarios.

  ## Examples

      iex> update_usuarios(usuarios, %{field: new_value})
      {:ok, %Usuarios{}}

      iex> update_usuarios(usuarios, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_usuarios(%Usuarios{} = usuarios, attrs) do
    usuarios
    |> Usuarios.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a usuarios.

  ## Examples

      iex> delete_usuarios(usuarios)
      {:ok, %Usuarios{}}

      iex> delete_usuarios(usuarios)
      {:error, %Ecto.Changeset{}}

  """
  def delete_usuarios(%Usuarios{} = usuarios) do
    Repo.delete(usuarios)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking usuarios changes.

  ## Examples

      iex> change_usuarios(usuarios)
      %Ecto.Changeset{source: %Usuarios{}}

  """
  def change_usuarios(%Usuarios{} = usuarios) do
    Usuarios.changeset(usuarios, %{})
  end
end
