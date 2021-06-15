defmodule FooCredentialsWeb.PageController do
  use FooCredentialsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
