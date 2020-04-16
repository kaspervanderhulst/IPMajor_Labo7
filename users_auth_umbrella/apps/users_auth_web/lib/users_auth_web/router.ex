defmodule UsersAuthWeb.Router do
  use UsersAuthWeb, :router

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

  pipeline :auth do
    plug UsersAuthWeb.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :allowed_for_users do
    plug UsersAuthWeb.Plugs.AuthorizationPlug, ["Admin", "Manager", "User"]
  end

  pipeline :allowed_for_managers do
    plug UsersAuthWeb.Plugs.AuthorizationPlug, ["Admin", "Manager"]
  end

  pipeline :allowed_for_admins do
    plug UsersAuthWeb.Plugs.AuthorizationPlug, ["Admin"]
  end

  scope "/", UsersAuthWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index
    get "/login", SessionController, :new
    post "/login", SessionController, :login
    get "/logout", SessionController, :logout
  end

  scope "/", UsersAuthWeb do
    pipe_through [:browser, :auth, :ensure_auth, :allowed_for_users]

    get "/user_scope", PageController, :user_index
  end

  scope "/", UsersAuthWeb do
    pipe_through [:browser, :auth, :ensure_auth, :allowed_for_managers]

    get "/manager_scope", PageController, :manager_index
  end

  scope "/admin", UsersAuthWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    resources "/users", UserController
    get "/", PageController, :admin_index
  end

  # Other scopes may use custom stacks.
  # scope "/api", UsersAuthWeb do
  #   pipe_through :api
  # end
end
