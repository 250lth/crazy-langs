defmodule BackgroundJob.Plug do
  @moduledoc false

  def init(opts), do: opts
  def call(conn, opts) do
    conn
    |> Plug.Conn.assign(:name, Keyword.get(opts, :name, "Background Job"))
    |> BackgroundJob.Router.call(opts)
  end

end
