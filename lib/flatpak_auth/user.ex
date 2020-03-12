defmodule FlatpakAuth.User do
  @moduledoc """
  Handles user registration and login information.
  """

  alias FlatpakAuth.{Email, Mailer, Repo}
  alias FlatpakAuth.Schema.User

  @doc """
  Creates a new user and sends a validation email.
  """
  def create(email) do
    with {:ok, user} <- get_unvalidated_user(email) do
      send_validation_email(user)
    else
      res -> res
    end
  end

  defp get_unvalidated_user(email) do
    user = Repo.get_by(User, email: email)

    case user do
      nil ->
        %User{}
        |> User.changeset(%{email: email})
        |> User.set_validation_code()
        |> Repo.insert()

      %{validation_complete: false} ->
        {:ok, user}

      _ ->
        {:error, "user already exists"}
    end
  end

  @doc """
  Sends the user a validation email.
  """
  def send_validation_email(user) do
    with {:ok, _} <- Mailer.deliver(Email.registration(user)) do
      {:ok, user}
    else
      _ -> {:error, "error sending email"}
    end
  end

  @doc """
  Sets a user with the given `validation_code` to valid.
  """
  def validate(%User{} = user) do
    {:ok, updated_user} = Repo.update(User.validate_changeset(user))
    topic = "user:" <> to_string(updated_user.id)

    FlatpakAuthWeb.Endpoint.broadcast(topic, "validated", %{})

    {:ok, updated_user}
  end

  def validate(validation_code) do
    user = Repo.get_by(User, validation_code: validation_code)

    if user != nil do
      validate(user)
    else
      {:error, "user not found"}
    end
  end
end
