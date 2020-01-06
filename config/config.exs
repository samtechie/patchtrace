# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :patchtrace,
  ecto_repos: [Patchtrace.Repo]

# Configures the endpoint
config :patchtrace, PatchtraceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HpeSO5j/fLnyj9e7yYIUxAF5cvMp+N3kla14VdeUsotG+Jh740QdM0XLAQ2K/LyJ",
  render_errors: [view: PatchtraceWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Patchtrace.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
