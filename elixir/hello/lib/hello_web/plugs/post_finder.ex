defmodule HelloWeb.PostFinder do
  @moduledoc false
  #use Plug
  import Plug.Conn

  alias Hello.Blog

  def init(opts), do: opts

  def call(conn, _) do
    case Blog.get_post(conn.params["id"]) do
      { :ok, post } -> assign(conn, :post, post)
      { :error, :notfound } ->
        conn
        |> send_resp(404, "Not found")
        |> halt()
    end
  end


end
