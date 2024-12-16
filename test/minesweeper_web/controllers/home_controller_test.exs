defmodule MinesweeperWeb.HomeControllerTest do
  use MinesweeperWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Minesweeper"
  end
end
