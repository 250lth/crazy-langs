defmodule Stack.Application do
  @moduledoc false
  
  @initial_state [1,2,3,4]

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Stack.Server, [@initial_state])
    ]

    opts = [strategy: :one_for_one, name: Stack.Supervisor]
    Supervisor.start_link(children, opts)
  end
end