# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elm_on_fire,
  ecto_repos: [ElmOnFire.Repo]

# Configures the endpoint
config :elm_on_fire, ElmOnFireWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Zuac7rorxpmAe1f2WPdQ1iCk5ze4BBrFJK/lYQOC2qSE8s0E1DHgEHnwHpsMz+ju",
  render_errors: [view: ElmOnFireWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElmOnFire.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
