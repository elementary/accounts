defmodule FlatpakAuthWeb.LoginLive do
  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(FlatpakAuthWeb.UserView, "login.html", assigns)
  end

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket, %{
       error: nil,
       waiting: false
     })}
  end

  def handle_event("login", %{"email" => email}, socket) do
    if email == "true@example.com" do
      {:noreply,
       assign(socket, %{
         error: nil,
         waiting: true
       })}
    else
      {:noreply,
       assign(socket, %{
         error: "User not found",
         waiting: false
       })}
    end
  end

  def handle_info(:login, socket) do
    # TODO: Redirect with header info
    {:noreply,
     assign(socket, %{
       error: "User not found",
       waiting: false
     })}
  end
end
