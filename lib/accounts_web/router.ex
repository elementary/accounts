defmodule AccountsWeb.Router do
  use AccountsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser

    if Keyword.get(Application.get_env(:accounts, Accounts.Mailer), :mailbox, false) do
      forward "/mail", Plug.Swoosh.MailboxPreview, base_path: "/mail"
    end
  end

  scope "/", AccountsWeb do
    pipe_through :browser

    get "/", HomepageController, :index
  end

  scope "/auth/v1", AccountsWeb do
    pipe_through :browser

    get "/", OauthController, :index
    get "/:token", OauthController, :continue
  end

  scope "/api/v1", AccountsWeb do
    pipe_through :api

    get "/history", PurchaseController, :index
    get "/view", PurchaseController, :view
    get "/purchase", PurchaseController, :create
  end
end
