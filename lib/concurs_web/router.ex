defmodule ConcursWeb.Router do
  use ConcursWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ConcursWeb do
    resources "/concursos", ConcursosController
    resources "/usuarios", UsuariosController
    resources "/inscricoes", InscricoesController
    pipe_through :api
  end
end
