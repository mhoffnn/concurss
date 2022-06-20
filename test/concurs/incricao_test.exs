defmodule Concurs.IncricaoTest do
  use Concurs.DataCase

  alias Concurs.Incricao

  describe "inscricao" do
    alias Concurs.Incricao.Inscricoes

    @valid_attrs %{descricao: "some descricao", timestamp: "some timestamp", votos: 42}
    @update_attrs %{descricao: "some updated descricao", timestamp: "some updated timestamp", votos: 43}
    @invalid_attrs %{descricao: nil, timestamp: nil, votos: nil}

    def inscricoes_fixture(attrs \\ %{}) do
      {:ok, inscricoes} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Incricao.create_inscricoes()

      inscricoes
    end

    test "list_inscricao/0 returns all inscricao" do
      inscricoes = inscricoes_fixture()
      assert Incricao.list_inscricao() == [inscricoes]
    end

    test "get_inscricoes!/1 returns the inscricoes with given id" do
      inscricoes = inscricoes_fixture()
      assert Incricao.get_inscricoes!(inscricoes.id) == inscricoes
    end

    test "create_inscricoes/1 with valid data creates a inscricoes" do
      assert {:ok, %Inscricoes{} = inscricoes} = Incricao.create_inscricoes(@valid_attrs)
      assert inscricoes.descricao == "some descricao"
      assert inscricoes.timestamp == "some timestamp"
      assert inscricoes.votos == 42
    end

    test "create_inscricoes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Incricao.create_inscricoes(@invalid_attrs)
    end

    test "update_inscricoes/2 with valid data updates the inscricoes" do
      inscricoes = inscricoes_fixture()
      assert {:ok, %Inscricoes{} = inscricoes} = Incricao.update_inscricoes(inscricoes, @update_attrs)
      assert inscricoes.descricao == "some updated descricao"
      assert inscricoes.timestamp == "some updated timestamp"
      assert inscricoes.votos == 43
    end

    test "update_inscricoes/2 with invalid data returns error changeset" do
      inscricoes = inscricoes_fixture()
      assert {:error, %Ecto.Changeset{}} = Incricao.update_inscricoes(inscricoes, @invalid_attrs)
      assert inscricoes == Incricao.get_inscricoes!(inscricoes.id)
    end

    test "delete_inscricoes/1 deletes the inscricoes" do
      inscricoes = inscricoes_fixture()
      assert {:ok, %Inscricoes{}} = Incricao.delete_inscricoes(inscricoes)
      assert_raise Ecto.NoResultsError, fn -> Incricao.get_inscricoes!(inscricoes.id) end
    end

    test "change_inscricoes/1 returns a inscricoes changeset" do
      inscricoes = inscricoes_fixture()
      assert %Ecto.Changeset{} = Incricao.change_inscricoes(inscricoes)
    end
  end
end
