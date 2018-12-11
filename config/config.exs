# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :vote_and_rate,
  ecto_repos: [VoteAndRate.Repo]

config :vote_and_rate, VoteAndRate.Gettext, default_locale: "en", locales: ~w(en ru)

# Configures the endpoint
config :vote_and_rate, VoteAndRateWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9XT+v3H9/k5o4dU0TJizolpVIrFKhKEuO/Furyd/1PUNZRDwviKYIsDqICE0ID/O",
  render_errors: [view: VoteAndRateWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: VoteAndRate.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
