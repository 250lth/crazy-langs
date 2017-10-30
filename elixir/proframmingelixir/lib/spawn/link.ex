defmodule Link do
  @moduledoc false
  import :timer, only: [ sleep: 1 ]

  def sad_function do
    sleep 5000
    exit(:boom)
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Link, :sad_function, [])
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
      after 1000 ->
        IO.puts "Nothing happened as far as I am concerned."
    end
  end

end

Link.run
