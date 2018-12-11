defmodule VoteAndRateWeb.PageControllerTest do
  use VoteAndRateWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/en")
    assert html_response(conn, 200) =~ "Free platform for online voting, rating and discussion"
  end
end
