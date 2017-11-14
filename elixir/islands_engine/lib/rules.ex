defmodule IslandsEngine.Rules do
  @behaviour :gen_statem

  alias IslandsEngine.Rules

  defstruct player1: :islands_not_set, player2: :islands_not_set

  # Client Functions

  def start_link do
    :gen_statem.start_link(__MODULE__, :ok, [])
  end

  def add_player(fsm) do
    :gen_statem.call(fsm, :add_player)
  end

  def move_island(fsm, player) when is_atom player do
    :gen_statem.call(fsm, {:move_island, player})
  end

  def set_islands(fsm, player) when is_atom player do
    :gen_statem.call(fsm, {:set_islands, player})
  end

  def guess_coordinate(fsm, player) when is_atom player do
    :gen_statem.call(fsm, {:guess_coordinate, player})
  end

  def win(fsm) do
    :gen_statem.call(fsm, :win)
  end

  def show_current_state(fsm) do
    :gen_statem.call(fsm, :show_current_state)
  end

  # Callbacks

  def init(:ok) do
    {:ok, :initialized, %Rules{}}
  end

  def callback_mode(), do: :state_functions

  def code_change(_vsn, state_name, state_data, _extra) do
    {:ok, state_name, state_data}
  end

  def terminate(_reason, _state, _data), do: :nothing

  def initialized({:call, from}, :add_player, state_data) do
    {:next_state, :players_set, state_data, {:reply, from, :ok}}
  end

  def initialized({:call, from}, :show_current_state, _state_data) do
    {:keep_state_and_data, {:reply, from, :initialized}}
  end

  def initialized({:call, from}, _, _state_data) do
    {:keep_state_and_data, {:reply, from, :error}}
  end

  def players_set({:call, from}, {:move_island, player}, state_data) do
    case Map.get(state_data, player) do
      :islands_not_set ->
        {:keep_state_and_data, {:reply, from, :ok}}
      :islands_set ->
        {:keep_state_and_data, {:reply, from, :error}}
    end
  end

  def players_set({:call, from}, {:set_islands, player}, state_data) do
    state_data = Map.put(state_data, player, :islands_set)
    set_islands_reply(from, state_data, state_data.player1, state_data.player2)
  end

  def players_set({:call, from}, :show_current_state, _state_data) do
    {:keep_state_and_data, {:reply, from, :players_set}}
  end

  def players_set({:call, from}, _, state_data) do
    {:keep_state_and_data, {:reply, from, :error}}
  end

  def player1_turn({:call, from}, {:guess_coordinate, :player1}, state_data) do
    {:next_state, :player2_turn, state_data, {:reply, from, :ok}}
  end

  def player1_turn({:call, from}, :win, state_data) do
    {:next_state, :game_over, state_data, {:reply, from, :ok}}
  end

  def player1_turn({:call, from}, :show_current_state, _state_data) do
    {:keep_state_and_data, {:reply, from, :player1_turn}}
  end

  def player1_turn({:call, from}, _, _state_data) do
    {:keep_state_and_data, {:reply, from, :error}}
  end

  def player2_turn({:call, from}, {:guess_coordinate, :player2}, state_data) do
    {:next_state, :player1_turn, state_data, {:reply, from, :ok}}
  end

  def player2_turn({:call, from}, :win, state_data) do
    {:next_state, :game_over, state_data, {:reply, from, :ok}}
  end

  def player2_turn({:call, from}, _, _state_data) do
    {:keep_state_and_data, {:reply, from, :error}}
  end

  def player2_turn({:call,from}, :show_current_state, _state_data) do
    {:keep_state_and_data, {:reply, from, :player2_turn}}
  end

  def game_over({:call, from}, :show_current_state, _state_data) do
    {:keep_state_and_data, {:reply, from, :game_over}}
  end

  def game_over({:call, from}, _, _state_data) do
    {:keep_state_and_data, {:reply, from, :error}}
  end

  defp set_islands_reply(from, state_data, status, status)
       when status == :islands_set do
    {:next_state, :player1_turn, state_data, {:reply, from, :ok}}
  end
  defp set_islands_reply(from, state_data, _, _) do
    {:keep_state, state_data, {:reply, from, :ok}}
  end
end
