# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :simple_auth,
  ecto_repos: [SimpleAuth.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :simple_auth, SimpleAuthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GeTyXXCMkfrUVEsTXFjmNmqpmRsMjeFwLvmIaudC9GAxbGpFHFwcb6/ftRb7DOX1",
  render_errors: [view: SimpleAuthWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SimpleAuth.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: SimpleAuth.User,
  repo: SimpleAuth.Repo,
  module: SimpleAuth,
  web_module: SimpleAuth.Web,
  router: SimpleAuth.Router,
  messages_backend: SimpleAuth.Coherence.Messages,
  logged_out_url: "/",
  user_active_field: true,
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:confirmable, :rememberable, :registerable, :invitable, :authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token]

config :coherence, SimpleAuth.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
