defmodule VoteAndRateWeb.PageController do
  use VoteAndRateWeb, :controller

  plug :put_locale_in_rander

  def index(conn, _params) do
    render(conn, "index.html")
  end

  defp put_locale_in_rander(conn, _locale) do
    assign(conn, :locale, conn.assigns.locale)
  end
end
