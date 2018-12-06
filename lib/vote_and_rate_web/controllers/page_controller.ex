defmodule VoteAndRateWeb.PageController do
  use VoteAndRateWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
