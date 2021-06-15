defmodule FooCredentialsWeb.SessionController do
    use FooCredentialsWeb, :controller

    alias FooCredentials.Accounts

    def new(conn, _) do
        render(conn, "new.html")
    end

    def create(conn, %{"user" => %{"email" => email, "password" => password}}) do
        case Accounts.authenticate_by_email_password(email, password) do
            {:ok, user} ->
                conn
                |> put_flash(:info, "welcome back!")
                |> put_session (:user_id, user.id)
                |> configure_session(renew, true)
                |> redirect(to: "/")
                
            {:error, :unauthorized} ->
                conn
                |> put_flash(:error, "Bad email/password")
                |> redirect(to: session_path(conn, :new))
        end
    end
end