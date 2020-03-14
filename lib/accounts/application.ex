defmodule Accounts.Application do
  @moduledoc """
  Application for Accounts. See https://hexdocs.pm/elixir/Application.html
  for more information on OTP Applications.
  """

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Accounts.Repo,
      # Start the endpoint when the application starts
      AccountsWeb.Endpoint
      # Starts a worker by calling: Accounts.Worker.start_link(arg)
      # {Accounts.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Accounts.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AccountsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
