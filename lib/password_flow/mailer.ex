defmodule PasswordFlow.Mailer do
  use Swoosh.Mailer, otp_app: :password_flow

  @doc "when you don't want the email success/failure to impact your process"
  @spec deliver_async(Swoosh.Email.t, Keyword.t) :: {:ok, term} | {:error, term}
  def deliver_async(email, config \\ []) do
    Task.start(fn -> deliver(email, config) end)
  end
end
