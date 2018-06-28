defmodule ElmOnFireWeb.PageController do
  use ElmOnFireWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
