# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :concurs, Concurso,
  database: "d5imfb3a0lh0nq",
  username: "lqyvkteughqafk",
  password: "11da72cfebf268d6cf1605e3e69acd106b905fc5bcc343e4c39ab92fe8265f37",
  hostname: "ec2-52-22-136-117.compute-1.amazonaws.com",
  port: "5432"

config :concurs,
  ecto_repos: [Concurs.Repo]

# Configures the endpoint
config :concurs, ConcursWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XUa6HOxe1C6IdpIGEAMn2g02J2Lso9ez7J2X7K23HJcrJCyiaV69U3RzbMDJlYNH",
  render_errors: [view: ConcursWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Concurs.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
