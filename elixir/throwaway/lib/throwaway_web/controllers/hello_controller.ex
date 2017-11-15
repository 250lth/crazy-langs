defmodule ThrowawayWeb.HelloController do
  use ThrowawayWeb, :controller

  def world(conn, %{"name" => name}) do
    render conn, "world.html", name: name
  end
end