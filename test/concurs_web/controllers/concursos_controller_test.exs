defmodule ConcursWeb.ConcursosControllerTest do
  use ConcursWeb.ConnCase

  alias Concurs.Concurso
  alias Concurs.Concurso.Concursos

  @create_attrs %{
    descricao: "some descricao",
    nome: "some nome",
    timestamp: "some timestamp"
  }
  @update_attrs %{
    descricao: "some updated descricao",
    nome: "some updated nome",
    timestamp: "some updated timestamp"
  }
  @invalid_attrs %{descricao: nil, nome: nil, timestamp: nil}

  def fixture(:concursos) do
    {:ok, concursos} = Concurso.create_concursos(@create_attrs)
    concursos
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all concurso", %{conn: conn} do
      conn = get(conn, Routes.concursos_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create concursos" do
    test "renders concursos when data is valid", %{conn: conn} do
      conn = post(conn, Routes.concursos_path(conn, :create), concursos: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.concursos_path(conn, :show, id))

      assert %{
               "id" => id,
               "descricao" => "some descricao",
               "nome" => "some nome",
               "timestamp" => "some timestamp"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.concursos_path(conn, :create), concursos: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update concursos" do
    setup [:create_concursos]

    test "renders concursos when data is valid", %{conn: conn, concursos: %Concursos{id: id} = concursos} do
      conn = put(conn, Routes.concursos_path(conn, :update, concursos), concursos: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.concursos_path(conn, :show, id))

      assert %{
               "id" => id,
               "descricao" => "some updated descricao",
               "nome" => "some updated nome",
               "timestamp" => "some updated timestamp"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, concursos: concursos} do
      conn = put(conn, Routes.concursos_path(conn, :update, concursos), concursos: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete concursos" do
    setup [:create_concursos]

    test "deletes chosen concursos", %{conn: conn, concursos: concursos} do
      conn = delete(conn, Routes.concursos_path(conn, :delete, concursos))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.concursos_path(conn, :show, concursos))
      end
    end
  end

  defp create_concursos(_) do
    concursos = fixture(:concursos)
    {:ok, concursos: concursos}
  end
end
