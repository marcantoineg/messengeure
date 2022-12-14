defmodule MessengeureWeb.PageController do
  use MessengeureWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def signup(conn, _params) do
    changeset = Accounts.register_changeset()
    render(conn, user_changeset: changeset)
  end

  def create_user(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, _} -> 
        conn
        |> put_flash(:info, "User created")
        |> redirect(to: "/")
      {:error, user_changeset} ->
        conn
        |> put_flash(:error, "Unable to create account!")
        |> render("signup.html", user_changeset: user_changeset)
    end
  end

  def login(conn, _params) do
    render(conn, "login.html")
  end
end
