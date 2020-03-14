defmodule Accounts.User do
  @moduledoc """
  Handles user registration and login information.
  """

  alias Accounts.{Email, Mailer, Repo}
  alias Accounts.Schema.{User, UserToken}

  defdelegate get(email), to: User

  @doc """
  Starts the login process for a person based on their email. We send them an
  email and once the link in the email is clicked, we dispatch an event that
  causes the user to complete login.
  """
  @spec login(User.t) :: {:ok, User.t} | {:error, :failed_dependency} | {:error, :not_found}
  def login(%User{} = user) do
    with {:ok, token} <- UserToken.create(user, "login"),
         :ok <- send_email(token) do
      {:ok, user}
    else
      {:error, error} -> {:error, error}
      nil -> {:error, :not_found}
    end
  end

  @doc """
  Starts the user registration process. First we create a new record. Then we
  send them an email with a link. When they click that link, we complete the
  registration process.
  """
  @spec create(String.t) :: {:ok, User.t} | {:error, :failed_dependency} | {:error, :not_found}
  def create(email) do
    with {:ok, user} <- User.create(email),
         {:ok, token} <- UserToken.create(user, "validate"),
         :ok <- send_email(token) do
      {:ok, user}
    else
      {:error, error} -> {:error, error}
      nil -> {:error, :not_found}
    end
  end

  @doc """
  Sends an email to a user for login or verify steps.
  """
  @spec send_email(UserToken.t) :: :ok | {:error, :failed_dependency}
  def send_email(token) do
    case Mailer.deliver(Email.send(token)) do
      {:ok, _} -> :ok
      _ -> {:error, :failed_dependency}
    end
  end

  @doc """
  Finishes the login or verify process with the given token or user record.
  """
  @spec complete(UserToken.t) :: {:ok, UserToken.t} | {:error, :not_found}
  def complete(%UserToken{} = token) do
    token
    |> Repo.preload([:user])
    |> Map.get(:user)
    |> UserToken.remove()

    topic = "user:" <> to_string(token.user_id)
    AccountsWeb.Endpoint.broadcast(topic, token.type, %{
      token: token,
      user: token.user
    })

    {:ok, token}
  end

  @spec complete(String.t) :: {:ok, UserToken.t} | {:error, :not_found}
  def complete(token) do
    case UserToken.get(token) do
      nil -> {:error, :not_found}
      token -> complete(token)
    end
  end
end
