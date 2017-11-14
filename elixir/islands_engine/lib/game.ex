defmodule IslandsEngine.Game do
  use GenServer
  alias IslandsEngine.{Game, Player, Rules}
  alias IslandsEngine.{Coordinate, IslandSet, Island}

  defstruct player1: :none, player2: :none, fsm: :none

  def start_link(name) when is_binary(name) and byte_size(name) > 0 do
    GenServer.start_link(__MODULE__, name, name: {:global, "game:#{name}"})
  end

  def init(name) do
    {:ok, player1} = Player.start_link(name)
    {:ok, player2} = Player.start_link()
    {:ok, fsm} = Rules.start_link
    {:ok, %Game{player1: player1, player2: player2, fsm: fsm}}
  end

  def stop(pid) do
    GenServer.cast(pid, :stop)
  end

  def call_demo(game) do
    GenServer.call(game, :demo)
  end

  def cast_demo(game) do
    GenServer.cast(game, :demo)
  end

  def add_player(pid, name) when name != nil do
    GenServer.call(pid, {:add_player, name})
  end

  def set_island_coordinates(pid, player, island, coordinates) when is_atom player and is_atom island do
    GenServer.call(pid, {:set_island_coordinates, player, island, coordinates})
  end

  def guess_coordinate(pid, player, coordinate) when is_atom player and is_atom coordinate do
    GenServer.call(pid, {:guess, player, coordinate})
  end

  def set_islands(pid, player) when is_atom player do
    GenServer.call(pid, {:set_islands, player})
  end

  ### CALLBACKS
  def handle_info(:first, state) do
    IO.puts "This message has been handled by handle_info/2, matching on :first."
    {:noreply, state}
  end

  def handle_call(:demo, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:add_player, name}, _from, state) do
    Rules.add_player(state.fsm)
    |> add_player_reply(state, name)
  end

  def handle_call({:set_island_coordinates, player, island, coordinates}, _from, state) do
    Rules.move_island(state.fsm, player)
    |> set_island_coordinates_reply(player, island, coordinates, state)
  end

  def handle_call({:guess, player, coordinate}, _from, state) do
    opponent = opponent(state, player)
    Rules.guess_coordinate(state.fsm, player)
    |> guess_reply(opponent.board, coordinate)
    |> forest_check(opponent, coordinate)
    |> win_check(opponent, state)
  end

  def handle_call({:set_islands, player}, _from, state) do
    reply = Rules.set_islands(state.fsm, player)
    {:reply, reply, state}
  end

  def handle_cast(:demo, state) do
    {:noreply, %{state | test: "new value"}}
  end

  def handle_cast(:stop, state) do
    {:stop, :normal, state}
  end

  ### private funcs
  defp opponent(state, :player1) do
    state.player2
  end

  defp opponent(state, _player2) do
    state.player1
  end

  defp forest_check(:miss, _opponent, _coordinate) do
    {:miss, :none}
  end

  defp forest_check(:hit, opponent, coordinate) do
    island_key = Player.forested_island(opponent, coordinate)
    {:hit, island_key}
  end

  defp forest_check({:error, :action_out_of_sequence}, _opponent_board, _coordinate) do
    {:error, :action_out_of_sequence}
  end

  defp win_check({hit_or_miss, :none}, _opponent, state) do
    {:reply, {hit_or_miss, :none, :no_win}, state}
  end

  defp win_check({:hit, island_key}, opponent, state) do
    win_status =
    case Player.win?(opponent) do
      true ->
        Rules.win(state.fsm)
        :win
      false -> :no_win
    end
    {:reply, {:hit, island_key, win_status}, state}
  end

  defp win_check({:error, :action_out_of_sequence}, _opponent, state) do
    {:reply, {:error, :action_out_of_sequence}, state}
  end

  defp add_player_reply(:ok, state, name) do
    Player.set_name(state.player2, name)
    {:reply, :ok, state}
  end

  defp add_player_reply(reply, state, _name) do
    {:reply, reply, state}
  end

  defp set_island_coordinates_reply(:ok, player, island, coordinates, state) do
    Map.get(state, player)
    |> Player.set_island_coordinates(island, coordinates)
    {:reply, :ok, state}
  end

  defp set_island_coordinates_reply(reply, _player, _island, _coordinates, state) do
    {:reply, reply, state}
  end

  defp guess_reply(:ok, opponent_board, coordinate) do
    Player.guess_coordinate(opponent_board, coordinate)
  end

  defp guess_reply({:error, :action_out_of_sequence}, _opponent_board, _coordinate) do
    {:error, :action_out_of_sequence}
  end
end