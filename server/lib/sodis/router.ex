defmodule Sodis.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(message()))
  end

  defp message do
    %{
      text: "Hello from Plug"
    }
  end

  match _ do
    send_resp(conn, 404, "Not found!")
  end
end
