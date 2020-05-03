# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :sbaudray, SbaudrayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "h8v4T1l69pJPSsIrWBoyKmDJAEXfxLUcLXm3nU94Nt53kNHqo2B4qQAYADvMHrTU",
  render_errors: [view: SbaudrayWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Sbaudray.PubSub,
  live_view: [signing_salt: "nQJvS0nJ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
