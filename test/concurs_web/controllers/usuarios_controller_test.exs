defmodule ConcursWeb.UsuariosControllerTest do
  use ConcursWeb.ConnCase

  alias Concurs.Usuario
  alias Concurs.Usuario.Usuarios

  @create_attrs %{
    email: "some email",
    idade: 42,
    nome: "some nome",
    senha: "7488a646-e31f-11e4-aace-600308960662",
    timestamp: "some timestamp"
  }
  @update_attrs %{
    email: "some updated email",
    idade: 43,
    nome: "some updated nome",
    senha: "7488a646-e31f-11e4-aace-600308960668",
    timestamp: "some updated timestamp"
  }
  @invalid_attrs %{email: nil, idade: nil, nome: nil, senha: nil, timestamp: nil}

  def fixture(:usuarios) do
    {:ok, usuarios} = Usuario.create_usuarios(@create_attrs)
    usuarios
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all usuario", %{conn: conn} do
      conn = get(conn, Routes.usuarios_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create usuarios" do
    test "renders usuarios when data is valid", %{conn: conn} do
      conn = post(conn, Routes.usuarios_path(conn, :create), usuarios: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.usuarios_path(conn, :show, id))

      assert %{
               "id" => id,
               "email" => "some email",
               "idade" => 42,
               "nome" => "some nome",
               "senha" => "7488a646-e31f-11e4-aace-600308960662",
               "timestamp" => "some timestamp"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.usuarios_path(conn, :create), usuarios: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update usuarios" do
    setup [:create_usuarios]

    test "renders usuarios when data is valid", %{conn: conn, usuarios: %Usuarios{id: id} = usuarios} do
      conn = put(conn, Routes.usuarios_path(conn, :update, usuarios), usuarios: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.usuarios_path(conn, :show, id))

      assert %{
               "id" => id,
               "email" => "some updated email",
               "idade" => 43,
               "nome" => "some updated nome",
               "senha" => "7488a646-e31f-11e4-aace-600308960668",
               "timestamp" => "some updated timestamp"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, usuarios: usuarios} do
      conn = put(conn, Routes.usuarios_path(conn, :update, usuarios), usuarios: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete usuarios" do
    setup [:create_usuarios]

    test "deletes chosen usuarios", %{conn: conn, usuarios: usuarios} do
      conn = delete(conn, Routes.usuarios_path(conn, :delete, usuarios))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.usuarios_path(conn, :show, usuarios))
      end
    end
  end

  defp create_usuarios(_) do
    usuarios = fixture(:usuarios)
    {:ok, usuarios: usuarios}
  end
end
