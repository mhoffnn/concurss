defmodule ConcursWeb.ConcursosView do
  use ConcursWeb, :view
  alias ConcursWeb.ConcursosView

  def render("index.json", %{concurso: concurso}) do
    %{data: render_many(concurso, ConcursosView, "concursos.json")}
  end

  def render("show.json", %{concursos: concursos}) do
    %{data: render_one(concursos, ConcursosView, "concursos.json")}
  end

  def render("concursos.json", %{concursos: concursos}) do
    %{id: concursos.id,
      nome: concursos.nome,
      descricao: concursos.descricao,
      timestamp: concursos.timestamp}
  end
end
