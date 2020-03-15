defmodule AccountsWeb.OauthControllerTest do
  use AccountsWeb.ConnCase

  test "register new user", %{conn: conn} do
    {:ok, view, html} = live(conn, Routes.oauth_path(@endpoint, :index))
    assert html =~ "email"

    assert render_submit(view, :submit, %{"email" => "testing@example.com"})
    assert render(view) =~ "registering"

    token = Repo.one!(Schema.UserToken)
    assert_email_sent Accounts.Email.send(token)

    email_link_html =
      build_conn()
      |> get(Routes.oauth_path(@endpoint, :continue, token.id))
      |> html_response(200)

    assert email_link_html =~ "return"
    assert render(view) =~ "return"
  end

  test "login existing user", %{conn: conn} do
    user = insert(:user)

    {:ok, view, html} = live(conn, Routes.oauth_path(@endpoint, :index))
    assert html =~ "email"

    assert render_submit(view, :submit, %{"email" => user.email})
    assert render(view) =~ "Login"

    token = Repo.one!(Schema.UserToken)
    assert_email_sent Accounts.Email.send(token)

    email_link_html =
      build_conn()
      |> get(Routes.oauth_path(@endpoint, :continue, token.id))
      |> html_response(200)

    assert email_link_html =~ "return"
    assert render(view) =~ "return"
  end
end
