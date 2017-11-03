defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    #conn
    #|> put_layout("admin.html")
    #|> render "index.html"
    redirect conn, to: "/redirect_test"
  end

  def redirect_test(conn, _params) do
    text conn, "Redirect!!"
  end

end
