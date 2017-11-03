defmodule HelloWeb.HelloController do
  @moduledoc false
  
  use HelloWeb, :controller

  plug :assign_welcome_message, "Welcome back!"

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have an error")
    |> assign(:message, "Welcome Forward")
    |> put_layout(false)
    |> render("index.html")
  end

  def show(conn, %{"messenger" => messenger}) do
    render conn, "show.html", messenger: messenger
  end

  defp assign_welcome_message(conn, msg) do
    assign(conn, :message, msg)
  end

end
