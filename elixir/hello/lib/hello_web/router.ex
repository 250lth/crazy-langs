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

    resources "/users", UserController
    resources "/posts", PostController, only: [:index, :show]
    resources "/comments", CommentController, except: [:delete]

    resources "/users", UserController do
      resources "/posts", PostController
    end

    resources "/reviews", ReviewController

  end

  scope "/admin", HelloWeb.Admin, as: :admin do
    pipe_through :browser

    resources "/reviews", ReviewController
    resources "/images", ImageController
    resources "/users", UserController
  end

  scope "/api", HelloWeb do
    pipe_through :api

    resources "/reviews", ReviewController
  end

  pipeline :review_checks do
    #plug :ensure_authenticated_user
    #plug :ensure_user_owns_review
  end

  scope "/reviews", HelloWeb do
    pipe_through :review_checks

    resources "/", ReviewController
  end

  forward "/jobs", BackgroundJob.Plug

  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  # end
end
