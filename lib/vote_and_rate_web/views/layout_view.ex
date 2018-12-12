defmodule VoteAndRateWeb.LayoutView do
  use VoteAndRateWeb, :view

  def get_current_lang do
    Gettext.get_locale(VoteAndRateWeb.Gettext)
  end

  def link_selector_lang(conn, select_lang) do
    Regex.replace(~r/#{get_current_lang()}/, conn.request_path, select_lang)
  end

  def og_locales do
    VoteAndRateWeb.Gettext.supported_locales
    |> Enum.map(fn lang ->
      current_lang = get_current_lang()

      case lang do
        lang when lang == current_lang -> {"og:locale", lang}
        lang -> {"og:locale:alternate", lang}
      end
    end)
  end

  def language_annotations(conn) do
    VoteAndRateWeb.Gettext.supported_locales
    |> Enum.reject(fn lang -> lang == get_current_lang() end)
    |> Enum.concat(["x-default"])
    |> Enum.map(fn lang ->
      case lang do
        "x-default" -> {"x-default", localized_url(conn, "")}
        lang -> {lang, localized_url(conn, "/#{lang}")}
      end
    end)
  end

  defp localized_url(conn, alt) do
    path = ~r/\/#{get_current_lang()}(\/(?:[^?]+)?|$)/
    |> Regex.replace(conn.request_path, "#{alt}\\1")

    Phoenix.Router.Helpers.url(VoteAndRateWeb.Router, conn) <> path
  end
end
