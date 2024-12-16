import Config

config :minesweeper, MinesweeperWeb.Endpoint,
  http: [port: 3001],
  pubsub_server: Minesweeper.PubSub,
  server: true,
  cache_static_manifest: "priv/static/cache_manifest.json",
username: System.get_env("DB_USERNAME"),
  password: System.get_env("DB_PASSWORD"),
  database: "minesweeper_prod"

# Do not print debug messages in production.
config :logger, level: :info

config :minesweeper, MinesweeperWeb.Endpoint,
  http: [
    transport_options: [socket_opts: [:inet6]]
  ]
