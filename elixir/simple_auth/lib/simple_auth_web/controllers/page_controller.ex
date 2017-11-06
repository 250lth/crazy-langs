defmodule SimpleAuthWeb.PageController do
  use SimpleAuthWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
