defmodule Spawn do

  def greet do
    receive do
      {sender, msg} ->
        send sender, { :ok, "Hello, #{msg}" }
    end
  end

end

pid = spawn(Spawn, :greet, [])
send pid, {self(), "World!!!"}

receive do
  {:ok, message} ->
    IO.puts message
end