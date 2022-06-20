defmodule ConcursWeb.UsuariosController do
  use ConcursWeb, :controller

  alias Concurs.Usuario
  alias Concurs.Usuario.Usuarios

  action_fallback ConcursWeb.FallbackController

  def index(conn, _params) do
    usuario = Usuario.list_usuario()
    render(conn, "index.json", usuario: usuario)
  end

  def create(conn, %{"usuarios" => usuarios_params}) do
    with {:ok, %Usuarios{} = usuarios} <- Usuario.create_usuarios(usuarios_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.usuarios_path(conn, :show, usuarios))
      |> render("show.json", usuarios: usuarios)
    end
  end

  def show(conn, %{"id" => id}) do
    usuarios = Usuario.get_usuarios!(id)
    render(conn, "show.json", usuarios: usuarios)
  end

  def update(conn, %{"id" => id, "usuarios" => usuarios_params}) do
    usuarios = Usuario.get_usuarios!(id)

    with {:ok, %Usuarios{} = usuarios} <- Usuario.update_usuarios(usuarios, usuarios_params) do
      render(conn, "show.json", usuarios: usuarios)
    end
  end

  def delete(conn, %{"id" => id}) do
    usuarios = Usuario.get_usuarios!(id)

    with {:ok, %Usuarios{}} <- Usuario.delete_usuarios(usuarios) do
      send_resp(conn, :no_content, "")
    end
  end
end
