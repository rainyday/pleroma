use Mix.Config

config :pleroma, Pleroma.Web.Endpoint,
   url: [host: "", scheme: "https", port: 443],
   secret_key_base: "iyj5kcJh1dcV4oucaXVFDCiIjvuggDXs1/+1A6QKuwu++u38r5/FX5ocpkrxUyze"

config :pleroma, :instance,
  name: "",
  email: "",
  limit: 5000,
  registrations_open: true

config :pleroma, :media_proxy,
  enabled: false,
  redirect_on_failure: true,
  base_url: "https://cache.example.com"

# Configure your database
config :pleroma, Pleroma.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "pleroma",
  password: "GttxGAs/qVvpSohSqm2sxzDGZiZdwQunFfJzv8Rv8Le5eJD7Qxwo4LNSDYvmpqOV",
  database: "pleroma_dev",
  hostname: "localhost",
  pool_size: 10
