defmodule PasswordFlow.Accounts.UserNotifier do
  use Phoenix.Swoosh, view: PasswordFlowWeb.UserConfirmationView, layout: {PasswordFlowWeb.LayoutView, :email}
  import Swoosh.Email

  defp sender, do: Application.get_env(:password_flow, PasswordFlow.Mailer)[:sender]

  defp as_mail(to) do
    new()
    |> to(to)
    |> from(sender())
    |> reply_to(sender())
  end

  @doc """
  Deliver instructions to confirm account. To be send sync or async through Mailer.
  """
  def deliver_confirmation_instructions(user, url) do
    as_mail(user)
      |> subject("Confirmer votre email")
      |> put_view(PasswordFlowWeb.UserConfirmationView)
      |> render_body("email_confirmation_instructions.html", %{ user: user, url: url})
  end

  @doc """
  Deliver instructions to reset a user password. To be send sync or async through Mailer.
  """
  def deliver_reset_password_instructions(user, url) do
    as_mail(user)
      |> subject("Réinitialiser votre mot de passe")
      |> put_view(PasswordFlowWeb.UserResetPasswordView)
      |> render_body("email_reset_instructions.html", %{ user: user, url: url})
  end

  @doc """
  Deliver instructions to update a user email. To be send sync or async through Mailer.
  """
  def deliver_update_email_instructions(user, url) do
    as_mail(user)
      |> subject("Mettre à jour votre email")
      |> put_view(PasswordFlowWeb.UserSettingsView)
      |> render_body("email_update_instructions.html", %{ user: user, url: url})
  end
end
