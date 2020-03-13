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
        "name" => to_string(key),
        "value" => value
      }
    end)
  end

  def registration(user) do
    registration_link = Router.Helpers.user_url(Endpoint, :validate, user.validation_code)
    options = %{registration_link: registration_link}

    copy = """
    Welcome to elementary AppCenter!

    Please click the link to create your AppCenter account!

    #{registration_link}
    """

    new()
    |> to({user.email, user.email})
    |> from({"elementary OS", "payments@elementary.io"})
    |> subject("Welcome!")
    |> text_body(copy)
    |> put_provider_option(:template_name, "register")
    |> put_provider_option(:template_content, map_options(options))
  end
end
