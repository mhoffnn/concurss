defmodule ConcursWeb.InscricoesController do
  use ConcursWeb, :controller

  alias Concurs.Incricao
  alias Concurs.Incricao.Inscricoes

  action_fallback ConcursWeb.FallbackController

  def index(conn, _params) do
    inscricao = Incricao.list_inscricao()
    render(conn, "index.json", inscricao: inscricao)
  end

  def create(conn, %{"inscricoes" => inscricoes_params}) do
    with {:ok, %Inscricoes{} = inscricoes} <- Incricao.create_inscricoes(inscricoes_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.inscricoes_path(conn, :show, inscricoes))
      |> render("show.json", inscricoes: inscricoes)
    end
  end

  def show(conn, %{"id" => id}) do
    inscricoes = Incricao.get_inscricoes!(id)
    render(conn, "show.json", inscricoes: inscricoes)
  end

  def update(conn, %{"id" => id, "inscricoes" => inscricoes_params}) do
    inscricoes = Incricao.get_inscricoes!(id)

    with {:ok, %Inscricoes{} = inscricoes} <- Incricao.update_inscricoes(inscricoes, inscricoes_params) do
      render(conn, "show.json", inscricoes: inscricoes)
    end
  end

  def delete(conn, %{"id" => id}) do
    inscricoes = Incricao.get_inscricoes!(id)

    with {:ok, %Inscricoes{}} <- Incricao.delete_inscricoes(inscricoes) do
      send_resp(conn, :no_content, "")
    end
  end
end
