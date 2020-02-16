defmodule FlatpakAuth.Application do
  @moduledoc """
  Application for FlatpakAuth. See https://hexdocs.pm/elixir/Application.html
  for more information on OTP Applications.
  """

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      FlatpakAuth.Repo,
      # Start the endpoint when the application starts
      FlatpakAuthWeb.Endpoint
      # Starts a worker by calling: FlatpakAuth.Worker.start_link(arg)
      # {FlatpakAuth.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FlatpakAuth.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FlatpakAuthWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
