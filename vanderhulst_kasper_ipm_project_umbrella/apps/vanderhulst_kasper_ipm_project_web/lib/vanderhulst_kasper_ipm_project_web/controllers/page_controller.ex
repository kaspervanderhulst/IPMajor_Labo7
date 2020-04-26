defmodule VanderhulstKasperIpmProjectWeb.PageController do
  use VanderhulstKasperIpmProjectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", role: "everyone")
  end

  def user_index(conn, _params) do
    render(conn, "index.html", role: "users")
  end

  def admin_index(conn, _params) do
    render(conn, "index.html", role: "admins")
  end
end
