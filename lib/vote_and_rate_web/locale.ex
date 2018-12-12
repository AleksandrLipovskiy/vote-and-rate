defmodule VoteAndRateWeb.Locale do
  import Plug.Conn

  @locales VoteAndRateWeb.Gettext.supported_locales

  def init(default), do: default

  def call(%Plug.Conn{params: %{"locale" => locale}} = conn, _default) when locale in @locales do
    if(locale != Gettext.get_locale(VoteAndRateWeb.Gettext), do: Gettext.put_locale(locale))
    assign(conn, :locale, locale)
  end

  def call(conn, default), do: redirect_with_default(conn, default)

  defp redirect_with_default(conn, default) do
    conn
    |> assign(:locale, default)
    |> redirect_to("/#{default}#{conn.request_path}")
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
