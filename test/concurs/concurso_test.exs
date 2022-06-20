defmodule Concurs.ConcursoTest do
  use Concurs.DataCase

  alias Concurs.Concurso

  describe "concurso" do
    alias Concurs.Concurso.Concursos

    @valid_attrs %{descricao: "some descricao", nome: "some nome", timestamp: "some timestamp"}
    @update_attrs %{descricao: "some updated descricao", nome: "some updated nome", timestamp: "some updated timestamp"}
    @invalid_attrs %{descricao: nil, nome: nil, timestamp: nil}

    def concursos_fixture(attrs \\ %{}) do
      {:ok, concursos} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Concurso.create_concursos()

      concursos
    end

    test "list_concurso/0 returns all concurso" do
      concursos = concursos_fixture()
      assert Concurso.list_concurso() == [concursos]
    end

    test "get_concursos!/1 returns the concursos with given id" do
      concursos = concursos_fixture()
      assert Concurso.get_concursos!(concursos.id) == concursos
    end

    test "create_concursos/1 with valid data creates a concursos" do
      assert {:ok, %Concursos{} = concursos} = Concurso.create_concursos(@valid_attrs)
      assert concursos.descricao == "some descricao"
      assert concursos.nome == "some nome"
      assert concursos.timestamp == "some timestamp"
    end

    test "create_concursos/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concurso.create_concursos(@invalid_attrs)
    end

    test "update_concursos/2 with valid data updates the concursos" do
      concursos = concursos_fixture()
      assert {:ok, %Concursos{} = concursos} = Concurso.update_concursos(concursos, @update_attrs)
      assert concursos.descricao == "some updated descricao"
      assert concursos.nome == "some updated nome"
      assert concursos.timestamp == "some updated timestamp"
    end

    test "update_concursos/2 with invalid data returns error changeset" do
      concursos = concursos_fixture()
      assert {:error, %Ecto.Changeset{}} = Concurso.update_concursos(concursos, @invalid_attrs)
      assert concursos == Concurso.get_concursos!(concursos.id)
    end

    test "delete_concursos/1 deletes the concursos" do
      concursos = concursos_fixture()
      assert {:ok, %Concursos{}} = Concurso.delete_concursos(concursos)
      assert_raise Ecto.NoResultsError, fn -> Concurso.get_concursos!(concursos.id) end
    end

    test "change_concursos/1 returns a concursos changeset" do
      concursos = concursos_fixture()
      assert %Ecto.Changeset{} = Concurso.change_concursos(concursos)
    end
  end
end
