defmodule ConcursWeb.InscricoesView do
  use ConcursWeb, :view
  alias ConcursWeb.InscricoesView

  def render("index.json", %{inscricao: inscricao}) do
    %{data: render_many(inscricao, InscricoesView, "inscricoes.json")}
  end

  def render("show.json", %{inscricoes: inscricoes}) do
    %{data: render_one(inscricoes, InscricoesView, "inscricoes.json")}
  end

  def render("inscricoes.json", %{inscricoes: inscricoes}) do
    %{id: inscricoes.id,
      votos: inscricoes.votos,
      descricao: inscricoes.descricao,
      timestamp: inscricoes.timestamp}
  end
end
