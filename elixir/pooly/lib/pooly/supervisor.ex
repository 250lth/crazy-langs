defmodule Pooly.Supervisor do
  @moduledoc false
  
  use Supervisor

  def start_link(pool_config) do
    Supervisor.start_link(__MODULE__, pool_config, name: __MODULE__)
  end

  def init(pool_config) do
    children = [
      supervisor(Pooly.PoolsSupervisor, []),
      worker(Pooly.Server, [self(), pool_config])
    ]

    opts = [strategy: :one_for_all]
    supervise(children, opts)
  end

end
