defmodule MessengeureWeb.PageControllerTest do
  use MessengeureWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Messengeure!"
  end
end
