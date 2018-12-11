defmodule VoteAndRateWeb.Locale do
  import Plug.Conn

  def init(default), do: default

  def call(conn, default) do
    locale = conn.params["locale"]

    if locale in VoteAndRateWeb.Gettext.supported_locales do
      conn 
      |> assign_locale!(locale)
    else
      path = localized_path(conn.request_path, default)

      conn 
      |> redirect_to(path)
    end
  end

  defp assign_locale!(conn, value) do
    Gettext.put_locale(value)

    conn
    |> assign(:locale, value)
  end

  defp localized_path(path, locale) do
    "/#{locale}#{path}"
  end

  defp redirect_to(conn, path) do
    redirect_path =
      unless blank?(conn.query_string) do
        path <> "?#{conn.query_string}"
      else
        path
      end

    conn 
    |> Phoenix.Controller.redirect(to: redirect_path)
  end

  defp blank?(str) do
    case str do
      nil -> true
      "" -> true
      " " <> r -> blank?(r)
      _ -> false
    end
  end
end
