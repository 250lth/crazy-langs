defmodule Sequence.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, initial_number) do
    #import Supervisor.Spec, warn: false
    # List all child processes to be supervised
    #children = [
      # Starts a worker by calling: Sequence.Worker.start_link(arg)
      # {Sequence.Worker, arg},
     # worker(Sequence.Server, [123])
    #]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    #opts = [strategy: :one_for_one, name: Sequence.Supervisor]
    #Supervisor.start_link(children, opts)
    { :ok, _pid } = Sequence.Supervisor.start_link(initial_number)
  end
end
