defmodule AccountsWeb.OauthView do
  use AccountsWeb, :view

  @doc """
  Takes some sort of error and returns a string
  """
  def error_message({:error, msg}),
    do: error_message(msg)

  def error_message(%Ecto.Changeset{} = changeset) do
    changeset.errors
    |> Enum.map(fn {key, {value, _}} -> "#{key} #{value}" end)
    |> Enum.join(", ")
  end

  def error_message(msg), do: msg
end
