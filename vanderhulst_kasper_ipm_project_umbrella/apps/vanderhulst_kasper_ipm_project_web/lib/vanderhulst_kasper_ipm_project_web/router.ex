defmodule VanderhulstKasperIpmProjectWeb.Router do
  use VanderhulstKasperIpmProjectWeb, :router

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
    plug VanderhulstKasperIpmProjectWeb.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :allowed_for_users do
    plug VanderhulstKasperIpmProjectWeb.Plugs.AuthorizationPlug, ["Admin","User"]
  end

  pipeline :allowed_for_admins do
    plug VanderhulstKasperIpmProjectWeb.Plugs.AuthorizationPlug, ["Admin"]
  end

  scope "/", VanderhulstKasperIpmProjectWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index
    get "/login", SessionController, :new
    post "/login", SessionController, :login
    get "/logout", SessionController, :logout
  end

  scope "/", VanderhulstKasperIpmProjectWeb do
    pipe_through [:browser, :auth, :ensure_auth, :allowed_for_users]

    get "/user_scope", PageController, :user_index
  end

  scope "/admin", VanderhulstKasperIpmProjectWeb do
    pipe_through [:browser, :auth, :ensure_auth, :allowed_for_admins]

    resources "/users", UserController
    get "/", PageController, :admin_index
  end
  # Other scopes may use custom stacks.
  # scope "/api", VanderhulstKasperIpmProjectWeb do
  #   pipe_through :api
  # end
end
