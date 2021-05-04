defmodule PasswordFlow.Repo do
  use Ecto.Repo,
    otp_app: :password_flow,
    adapter: Ecto.Adapters.Postgres
end
