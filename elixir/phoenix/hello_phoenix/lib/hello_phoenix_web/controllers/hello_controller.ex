defmodule HelloPhoenixWeb.HelloController do
  @moduledoc false
  
  use HelloPhoenixWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

end
