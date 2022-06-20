defmodule ConcursWeb.ConcursosController do
  use ConcursWeb, :controller

  alias Concurs.Concurso
  alias Concurs.Concurso.Concursos

  action_fallback ConcursWeb.FallbackController

  def index(conn, _params) do
    concurso = Concurso.list_concurso()
    render(conn, "index.json", concurso: concurso)
  end

  def create(conn, %{"concursos" => concursos_params}) do
    with {:ok, %Concursos{} = concursos} <- Concurso.create_concursos(concursos_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.concursos_path(conn, :show, concursos))
      |> render("show.json", concursos: concursos)
    end
  end

  def show(conn, %{"id" => id}) do
    concursos = Concurso.get_concursos!(id)
    render(conn, "show.json", concursos: concursos)
  end

  def update(conn, %{"id" => id, "concursos" => concursos_params}) do
    concursos = Concurso.get_concursos!(id)

    with {:ok, %Concursos{} = concursos} <- Concurso.update_concursos(concursos, concursos_params) do
      render(conn, "show.json", concursos: concursos)
    end
  end

  def delete(conn, %{"id" => id}) do
    concursos = Concurso.get_concursos!(id)

    with {:ok, %Concursos{}} <- Concurso.delete_concursos(concursos) do
      send_resp(conn, :no_content, "")
    end
  end
end
