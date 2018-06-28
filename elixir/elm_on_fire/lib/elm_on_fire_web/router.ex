defmodule ElmOnFireWeb.Router do
  use ElmOnFireWeb, :router

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

  scope "/", ElmOnFireWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  #Other scopes may use custom stacks.
  scope "/api", ElmOnFireWeb do
    pipe_through :api

    resources "/students", StudentController, except: [:new, :edit]
  end
end
