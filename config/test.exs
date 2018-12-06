use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :vote_and_rate, VoteAndRateWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :vote_and_rate, VoteAndRate.Repo,
  username: "phoenix",
  password: "123456",
  database: "vote_and_rate_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
