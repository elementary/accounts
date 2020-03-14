defmodule Accounts.Release do
  @moduledoc """
  This module is used for when you need to make release updates like database
  migrations. It's easy to run with the docker container just like:

  ```sh
  docker run elementary/accounts eval Accounts.Release.migrate
  ```
  """

  @app :accounts

  def migrate do
    for repo <- repos() do
      {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    end
  end

  def rollback(repo, version) do
    {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end

  defp repos do
    Application.load(@app)
    Application.fetch_env!(@app, :ecto_repos)
  end
end
