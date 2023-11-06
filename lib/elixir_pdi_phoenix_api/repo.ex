defmodule ElixirPdiPhoenixApi.Repo do
  use Ecto.Repo,
    otp_app: :elixir_pdi_phoenix_api,
    adapter: Ecto.Adapters.Postgres
end
