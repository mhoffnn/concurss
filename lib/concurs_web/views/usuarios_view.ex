defmodule ConcursWeb.UsuariosView do
  use ConcursWeb, :view
  alias ConcursWeb.UsuariosView

  def render("index.json", %{usuario: usuario}) do
    %{data: render_many(usuario, UsuariosView, "usuarios.json")}
  end

  def render("show.json", %{usuarios: usuarios}) do
    %{data: render_one(usuarios, UsuariosView, "usuarios.json")}
  end

  def render("usuarios.json", %{usuarios: usuarios}) do
    %{id: usuarios.id,
      nome: usuarios.nome,
      idade: usuarios.idade,
      email: usuarios.email,
      senha: usuarios.senha,
      timestamp: usuarios.timestamp}
  end
end
