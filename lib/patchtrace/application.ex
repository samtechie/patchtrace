defmodule Patchtrace.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Patchtrace.Repo,
      # Start the endpoint when the application starts
      PatchtraceWeb.Endpoint
      # Starts a worker by calling: Patchtrace.Worker.start_link(arg)
      # {Patchtrace.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Patchtrace.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PatchtraceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
