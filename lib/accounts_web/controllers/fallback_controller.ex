defmodule AccountsWeb.FallbackController do
  use AccountsWeb, :controller

  def call(conn, {:error, :not_found}) do
    put_status(conn, :not_found)
  end

  def call(conn, {:error, :failed_dependency}) do
    put_status(conn, :failed_dependency)
  end

  def call(conn, _err) do
    put_status(conn, :internal_error)
  end
end
