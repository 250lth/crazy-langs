defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    #conn
    #|> put_layout("admin.html")
    #|> render "index.html"
    #redirect conn, to: "/redirect_test"
    pages = [%{title: "foo"}, %{title: "bar"}]
    render conn, "index.json", pages: pages
  end

  def show(conn, _params) do
    page = [%{title: "foo"}, %{title: "bar"}]
    render conn, "show.json", page: page
  end

  def redirect_test(conn, _params) do
    text conn, "Redirect!!"
  end

end
