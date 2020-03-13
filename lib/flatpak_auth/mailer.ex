defmodule FlatpakAuth.Mailer do
  @moduledoc """
  OTP app for Swoosh email sending.
  """

  use Swoosh.Mailer, otp_app: :flatpak_auth
end
