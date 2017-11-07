defmodule GenstageExample.Consumer do
  @moduledoc false

  use GenStage
  
  def start_link do
    GenStage.start_link(__MODULE__, :state_doesnt_matter)
  end

  def init(state) do
    { :consumer, state, subscribe_to:
      [GenstageExample.ProducerConsumer]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect {self(), event, state}
    end

    { :noreply, [], state }
  end

end
