defmodule UserPersonalInfoController do
  use PasswordFlowWeb, :controller

  alias PasswordFlow.Accounts

  def update(conn, params) do
    Accounts.update_personal_info(conn.assigns.user, params)
    render(conn, "personnal_info.html")
  end
end
