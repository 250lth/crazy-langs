defmodule ThrowawayWeb.Router do
  use ThrowawayWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ThrowawayWeb do
    pipe_through :browser # Use the default browser stack

    get "/hello/:name", HelloController, :world
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ThrowawayWeb do
  #   pipe_through :api
  # end
end
