use Mix.Config

config :minimal_server, MinimalServer.Repo,
  database: "minimal_server_test",
  username: "root",
  password: "root",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config(:minimal_server, port: 4002)
