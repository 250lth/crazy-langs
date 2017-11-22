defmodule Blitzy.Worker do
  @moduledoc false
  
  use Timex
  require Logger

  def start(url) do
    {timestamp, respnse} = Duration.measure(fn -> HTTPoison.get(url) end)
    handle_response({Duration.to_milliseconds(timestamp), respnse})
  end

  def start(url, caller, func \\ &HTTPoison.get/1) do
    {timestamp, response} = Duration.measure(fn -> func.(url) end)
    caller
    |> send({self,
            handle_response({Duration.to_milliseconds.(timestamp), response})})
  end

  defp handle_response({msecs, {:ok, %HTTPoison.Response{status_code: code}}}) when code >= 200 and code <= 304 do
    Logger.info "worker [#{node}-#{inspect self}] completed in #{msecs} msecs"
    {:ok, msecs}
  end

  defp handle_response({_msecs, {:error, reason}}) do
    Logger.info "worker [#{node}-#{inspect self}] error due to #{inspect reason}"
    {:error, reason}
  end

  defp handle_response({_msecs, _}) do
    Logger.info "worker [#{node}-#{inspect self}] errored out"
    {:error, :unknown}
  end
end
