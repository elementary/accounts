defmodule Accounts.Email do
  @moduledoc """
  Handles templating and setup work for emails.
  """

  import Swoosh.Email

  alias Accounts.Repo
  alias Accounts.Schema.UserToken
  alias AccountsWeb.{Endpoint, Router}

  def send(%UserToken{} = token) do
    user =
      token
      |> Repo.preload([:user])
      |> Map.get(:user)

    case token.type do
      "login" -> login(user, token)
      "validate" -> verify(user, token)
    end
  end

  def login(user, token) do
    url = Router.Helpers.oauth_url(Endpoint, :continue, token.id)
    options = %{url: url}

    new()
    |> to({user.email, user.email})
    |> from({"elementary AppCenter", "appcenter@elementary.io"})
    |> put_provider_option(:global_merge_vars, map_options(options))
    |> put_provider_option(:merge_language, "handlebars")
    |> put_provider_option(:merge, true)
    |> put_provider_option(:template_content, map_options(options))
    |> put_provider_option(:template_name, "flatpak-login")
  end

  def verify(user, token) do
    url = Router.Helpers.oauth_url(Endpoint, :continue, token.id)
    options = %{url: url}

    new()
    |> to({user.email, user.email})
    |> from({"elementary AppCenter", "appcenter@elementary.io"})
    |> put_provider_option(:global_merge_vars, map_options(options))
    |> put_provider_option(:merge_language, "handlebars")
    |> put_provider_option(:merge, true)
    |> put_provider_option(:template_content, map_options(options))
    |> put_provider_option(:template_name, "flatpak-register")
  end

  defp map_options(options) do
    options
    |> Map.to_list()
    |> Enum.map(fn {key, value} ->
      %{
        "name" => String.upcase(to_string(key)),
        "content" => value
      }
    end)
  end
end
