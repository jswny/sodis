defmodule Sodis.Endpoint do
  use Plug.Router
  alias Sodis.Router

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(_opts) do
    Plug.Adapters.Cowboy.http(__MODULE__, [port: 4000])
  end

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:dispatch)

  forward("/", to: Router)
end
