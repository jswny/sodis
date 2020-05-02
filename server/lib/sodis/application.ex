defmodule Sodis.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    :ets.new(:place_data, [:set, :public, :named_table])

    children = [
      # Starts a worker by calling: Sodis.Worker.start_link(arg)
      # {Sodis.Worker, arg}
      Sodis.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sodis.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
