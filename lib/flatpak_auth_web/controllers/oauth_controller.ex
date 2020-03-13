defmodule FlatpakAuthWeb.OauthController do
  use FlatpakAuthWeb, :controller

  alias FlatpakAuth.User

  plug :put_layout, "oauth.html"

  def index(conn, _params) do
    live_render(conn, FlatpakAuthWeb.OauthLive)
  end

  def continue(conn, %{"token" => uuid}) do
    case User.complete(uuid) do
      {:ok, token} -> render(conn, "complete.html", %{token: token})
      {:error, :not_found} -> render(conn, "expired.html")
    end
  end
end
