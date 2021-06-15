defmodule FooCredentials.Repo do
  use Ecto.Repo,
    otp_app: :fooCredentials,
    adapter: Ecto.Adapters.Postgres
end
