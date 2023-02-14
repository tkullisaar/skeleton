# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :skeleton, SkeletonWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: SkeletonWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Skeleton.PubSub,
  live_view: [signing_salt: "+tb609fu"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :skeleton, Skeleton.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :surface, :components, [
  {Surface.Components.Form.ErrorTag,
   default_translator: {MoonWeb.ErrorHelpers, :translate_error}},
  # lib part
  {Moon.Components.Form, propagate_context_to_slots: true},
  {Moon.Components.Field, propagate_context_to_slots: true},
  {Moon.Components.TextInput, propagate_context_to_slots: true},
  {Moon.Components.Select.Dropdown, propagate_context_to_slots: true},
  {Moon.Design.MenuItem, propagate_context_to_slots: true},
  {Moon.Design.Tabs, propagate_context_to_slots: true},
  {Moon.Design.Tooltip.Content, propagate_context_to_slots: true},
  {Moon.Design.Accordion, propagate_context_to_slots: true},
  {Moon.Design.Modal, propagate_context_to_slots: true},
  {Moon.Design.Modal.Panel, propagate_context_to_slots: true},
  {Moon.Design.Dropdown, propagate_context_to_slots: true},
  {Moon.Design.Snackbar, propagate_context_to_slots: true},
  {Moon.Design.Snackbar.Close, propagate_context_to_slots: true},
  # app part
  {MoonWeb.Components.SidebarLink, propagate_context_to_slots: false}
]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
