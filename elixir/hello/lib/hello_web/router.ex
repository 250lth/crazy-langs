defmodule HelloWeb.Router do
  use HelloWeb, :router

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

  scope "/", HelloWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show

    get "/images", ImageController, :index

    resources "/users", UserController do
      resources "/posts", PostController
    end

    resources "/posts", PostController, only: [:index, :show]
    resources "/comments", CommentController, except: [:delete]
    resources "/reviews", ReviewController

  end

  scope "/admin", HelloWeb.Admin, as: :admin do
    pipe_through :browser

    resources "/reviews", ReviewController
    resources "/images", ImageController
    resources "/users", UserController
  end

  scope "/api", HelloWeb.Api, as: :api do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/images", ImageController
      resources "/reviews", ReviewController
      resources "/users", UserController
    end
  end

  #scope "/" do
  #  pipe_through [:authenticate_user, :ensure_admin]
  #  forward "/jobs", BackgroundJob.Plug
  #end

  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  # end
end
