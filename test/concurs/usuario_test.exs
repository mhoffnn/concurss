defmodule Concurs.UsuarioTest do
  use Concurs.DataCase

  alias Concurs.Usuario

  describe "usuario" do
    alias Concurs.Usuario.Usuarios

    @valid_attrs %{email: "some email", idade: 42, nome: "some nome", senha: "7488a646-e31f-11e4-aace-600308960662", timestamp: "some timestamp"}
    @update_attrs %{email: "some updated email", idade: 43, nome: "some updated nome", senha: "7488a646-e31f-11e4-aace-600308960668", timestamp: "some updated timestamp"}
    @invalid_attrs %{email: nil, idade: nil, nome: nil, senha: nil, timestamp: nil}

    def usuarios_fixture(attrs \\ %{}) do
      {:ok, usuarios} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Usuario.create_usuarios()

      usuarios
    end

    test "list_usuario/0 returns all usuario" do
      usuarios = usuarios_fixture()
      assert Usuario.list_usuario() == [usuarios]
    end

    test "get_usuarios!/1 returns the usuarios with given id" do
      usuarios = usuarios_fixture()
      assert Usuario.get_usuarios!(usuarios.id) == usuarios
    end

    test "create_usuarios/1 with valid data creates a usuarios" do
      assert {:ok, %Usuarios{} = usuarios} = Usuario.create_usuarios(@valid_attrs)
      assert usuarios.email == "some email"
      assert usuarios.idade == 42
      assert usuarios.nome == "some nome"
      assert usuarios.senha == "7488a646-e31f-11e4-aace-600308960662"
      assert usuarios.timestamp == "some timestamp"
    end

    test "create_usuarios/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usuario.create_usuarios(@invalid_attrs)
    end

    test "update_usuarios/2 with valid data updates the usuarios" do
      usuarios = usuarios_fixture()
      assert {:ok, %Usuarios{} = usuarios} = Usuario.update_usuarios(usuarios, @update_attrs)
      assert usuarios.email == "some updated email"
      assert usuarios.idade == 43
      assert usuarios.nome == "some updated nome"
      assert usuarios.senha == "7488a646-e31f-11e4-aace-600308960668"
      assert usuarios.timestamp == "some updated timestamp"
    end

    test "update_usuarios/2 with invalid data returns error changeset" do
      usuarios = usuarios_fixture()
      assert {:error, %Ecto.Changeset{}} = Usuario.update_usuarios(usuarios, @invalid_attrs)
      assert usuarios == Usuario.get_usuarios!(usuarios.id)
    end

    test "delete_usuarios/1 deletes the usuarios" do
      usuarios = usuarios_fixture()
      assert {:ok, %Usuarios{}} = Usuario.delete_usuarios(usuarios)
      assert_raise Ecto.NoResultsError, fn -> Usuario.get_usuarios!(usuarios.id) end
    end

    test "change_usuarios/1 returns a usuarios changeset" do
      usuarios = usuarios_fixture()
      assert %Ecto.Changeset{} = Usuario.change_usuarios(usuarios)
    end
  end
end
