# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :password_flow,
  ecto_repos: [PasswordFlow.Repo]

# Configures the endpoint
config :password_flow, PasswordFlowWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NcMkKQvs0pKUDpjOXAyE0nqBtjtJbdwEqISLkjRXE7Pka/YmxJDPdVnZWCPwSWw6",
  render_errors: [view: PasswordFlowWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PasswordFlow.PubSub,
  live_view: [signing_salt: "TDZcrz/6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Configure Mailing
# config :password_flow, PasswordFlow.Mailer,
#   adapter: Swoosh.Adapters.Sendgrid,
# api_key, define it in secret and unversion it

# config :password_flow, PasswordFlow.Mailer,
#   adapter: Swoosh.Adapters.Local

config :swoosh, serve_mailbox: true, preview_port: 4001
