defmodule B do
  @moduledoc false
  
  use GenStage

  def start_link(number) do
    GenStage.start_link(B, number)
  end

  def init(number) do
    {:producer_consumer, number, subscribe_to: [{A, max_demand: 10}]}
  end

  def handle_events(events, _from, number) do
    events = Enum.map(events, & &1 * number)
    {:noreply, events, number}
  end

end
