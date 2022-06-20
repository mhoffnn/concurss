defmodule Concurs.Repo do
  use Ecto.Repo,
    otp_app: :concurs,
    adapter: Ecto.Adapters.Postgres
end
