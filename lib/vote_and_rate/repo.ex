defmodule VoteAndRate.Repo do
  use Ecto.Repo,
    otp_app: :vote_and_rate,
    adapter: Ecto.Adapters.Postgres
end
