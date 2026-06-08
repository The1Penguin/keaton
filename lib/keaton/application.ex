defmodule Keaton.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KeatonWeb.Telemetry,
      Keaton.Repo,
      {DNSCluster, query: Application.get_env(:keaton, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Keaton.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Keaton.Finch},
      # Start a worker by calling: Keaton.Worker.start_link(arg)
      # {Keaton.Worker, arg},
      # Start to serve requests, typically the last entry
      KeatonWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Keaton.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KeatonWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
