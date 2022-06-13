defmodule Av3ElixirWeb.PageController do
  use Av3ElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
