defmodule Refraner.Application do
  use Application

  require Logger

  def start(_type, _args) do
    children = [
      Refraner.Repo
    ]

    opts = [strategy: :one_for_one, name: Refraner]

    case Supervisor.start_link(children, opts) do
      {:ok, _} = ok ->
        Logger.info("Starting Refraner SQLite")
        ok

      error ->
        Logger.error("Error starting Refraner SQLite")
        error
    end
  end
end
