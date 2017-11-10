defmodule Easy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    import Supervisor.Spec
    children = [
      # Starts a worker by calling: Easy.Worker.start_link(arg)
      # {Easy.Worker, arg},
      #worker(A, [0]),
      #worker(B, [2]),
      #worker(C, []),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Easy.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
