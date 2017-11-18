defmodule ThrowawayWeb.PageController do
  use ThrowawayWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
