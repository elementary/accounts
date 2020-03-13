defmodule FlatpakAuthWeb.OauthLive do
  @moduledoc """
  Socket handling for browser updating on the login page.
  """

  use Phoenix.LiveView

  alias Ecto.Changeset
  alias FlatpakAuth.User

  @default_state [
    template: "login.html",
    user: nil,
    token: nil,
    error: nil
  ]

  def render(assigns) do
    Phoenix.View.render(FlatpakAuthWeb.OauthView, assigns.template, assigns)
  end

  defp set(socket, params \\ []) do
    assigns = Keyword.merge(@default_state, params)
    assign(socket, assigns)
  end

  defp wait(socket, user) do
    with {:ok, user} <- User.login(user.email) do
      FlatpakAuthWeb.Endpoint.subscribe("user:" <> to_string(user.id))
      {:noreply, set(socket, template: "logging_in.html", user: user)}
    end
  end

  defp register(socket, email) do
    with {:ok, user} <- User.create(email) do
      FlatpakAuthWeb.Endpoint.subscribe("user:" <> to_string(user.id))
      {:noreply, set(socket, template: "registering.html", user: user)}
    end
  end

  def mount(_params, _session, socket) do
    {:ok, set(socket)}
  end

  def handle_event("login", %{"email" => email}, socket) do
    case User.get(email) do
      nil -> register(socket, email)
      user -> wait(socket, user)
    end
  end

  def handle_info(%{event: "login", payload: %{token: token}}, socket) do
    {:noreply, set(socket, template: "complete.html", token: token)}
  end

  def handle_info(%{event: "validate", payload: %{token: token}}, socket) do
    {:noreply, set(socket, template: "complete.html", token: token)}
  end
end
