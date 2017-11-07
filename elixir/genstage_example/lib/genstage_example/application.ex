defmodule GenstageExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  import Supervisor.Spec, warn: false

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: GenstageExample.Worker.start_link(arg)
      # {GenstageExample.Worker, arg},
      worker(GenstageExample.Producer, [0]),
      worker(GenstageExample.ProducerConsumer, []),
      worker(GenstageExample.Consumer, [], id: 1),
      worker(GenstageExample.Consumer, [], id: 2),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GenstageExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
