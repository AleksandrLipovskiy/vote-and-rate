defmodule VoteAndRateWeb.Router do
  use VoteAndRateWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug VoteAndRateWeb.Locale, "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", VoteAndRateWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/:locale", VoteAndRateWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", VoteAndRateWeb do
  #   pipe_through :api
  # end
end
