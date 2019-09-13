use Mix.Config

config :minimal_server, MinimalServer.Repo,
  database: "minimal_server_repo",
  username: "root",
  password: "root",
  hostname: "localhost"

config(:minimal_server, ecto_repos: [MinimalServer.Repo])

import_config("#{Mix.env()}.exs")
