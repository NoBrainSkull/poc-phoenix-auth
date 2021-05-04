defmodule PasswordFlowWeb.PageController do
  use PasswordFlowWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
