# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_view_todo,
  ecto_repos: [LiveViewTodo.Repo]

# Configures the endpoint
config :live_view_todo, LiveViewTodoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KYCF1QyldMuwCoTI2V5iOXp6dgU8+GPkGNyvTGY5fzdRn4jJCPaN6X0Cpl2u0dIP",
  render_errors: [view: LiveViewTodoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveViewTodo.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "Vc+71eZzTo2AH/gIZhyd4PRGWWVXvLJY"] 

config :phoenix, template_engines: [leex: Phoenix.LiveView.Engine]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
