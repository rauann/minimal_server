defmodule MinimalServer.Repo do
  use Ecto.Repo,
    otp_app: :minimal_server,
    adapter: Ecto.Adapters.Postgres
end
