defmodule ElixirPdiPhoenixApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElixirPdiPhoenixApiWeb.Telemetry,
      ElixirPdiPhoenixApi.Repo,
      {DNSCluster,
       query: Application.get_env(:elixir_pdi_phoenix_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ElixirPdiPhoenixApi.PubSub},
      # Start a worker by calling: ElixirPdiPhoenixApi.Worker.start_link(arg)
      # {ElixirPdiPhoenixApi.Worker, arg},
      # Start to serve requests, typically the last entry
      ElixirPdiPhoenixApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirPdiPhoenixApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirPdiPhoenixApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
