defmodule MessengeureWeb.Router do
  use MessengeureWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :put_root_layout, {MessengeureWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MessengeureWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/signup", PageController, :signup
    get "/login", PageController, :login
  end

  # Other scopes may use custom stacks.
  # scope "/api", MessengeureWeb do
  #   pipe_through :api
  # end
end
