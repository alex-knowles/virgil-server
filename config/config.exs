# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :virgil,
  ecto_repos: [Virgil.Repo]

# Configures the endpoint
config :virgil, Virgil.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SCbqtRm641Mibse+jh6HEDWd0sgJKGncDEgo436GVr4tEcg1gvsCzD4Ok2YjY2Ms",
  render_errors: [view: Virgil.ErrorView, accepts: ~w(json)],
  pubsub: [name: Virgil.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
