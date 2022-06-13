defmodule Av3Elixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Av3Elixir.Repo,
      # Start the Telemetry supervisor
      Av3ElixirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Av3Elixir.PubSub},
      # Start the Endpoint (http/https)
      Av3ElixirWeb.Endpoint
      # Start a worker by calling: Av3Elixir.Worker.start_link(arg)
      # {Av3Elixir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Av3Elixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Av3ElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
