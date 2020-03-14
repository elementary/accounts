defmodule Accounts.Release do
  @moduledoc """
  This module is used for when you need to make release updates like database
  migrations. It's easy to run with the docker container just like:

  ```sh
  docker run elementary/accounts eval Accounts.Release.migrate
  ```
  """

  @apps [:accounts, :ssl]

  def migrate do
    load()

    for repo <- repos() do
      {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    end
  end

  def rollback(repo, version) do
    load()

    {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end

  defp load do
    for app <- @apps do
      Application.load(app)
    end
  end

  defp repos do
    Application.fetch_env!(:accounts, :ecto_repos)
  end
end
