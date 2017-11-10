defmodule C do
  @moduledoc false
  
  use GenStage

  def start_link() do
    GenStage.start_link(C, :ok)
  end

  def init(:ok) do
    {:consumer, :the_state_does_not_matter, subscribe_to: [B]}
  end

  def handle_events(events, _from, state) do
    Process.sleep(1000)
    IO.inspect(events)
    {:noreply, [], state}
  end

end
