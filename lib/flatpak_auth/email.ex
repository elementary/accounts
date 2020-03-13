defmodule FlatpakAuth.Email do
  @moduledoc """
  Handles templating and setup work for emails.
  """

  import Swoosh.Email

  alias FlatpakAuthWeb.{Endpoint, Router}

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

  def registration(user) do
    registration_link = Router.Helpers.user_url(Endpoint, :validate, user.validation_code)
    options = %{url: registration_link}

    new()
    |> to({user.email, user.email})
    |> from({"elementary AppCenter", "appcenter@elementary.io"})
    |> put_provider_option(:global_merge_vars, map_options(options))
    |> put_provider_option(:merge_language, "handlebars")
    |> put_provider_option(:merge, true)
    |> put_provider_option(:template_content, map_options(options))
    |> put_provider_option(:template_name, "flatpak-register")
  end
end
