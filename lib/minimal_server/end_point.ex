defmodule MinimalServer.EndPoint do
  use Plug.Router

  plug(Plug.Logger)
  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:dispatch)

  forward("/api", to: MinimalServer.Router)

  match _ do
    send_resp(conn, 404, "oops... nothing here!")
  end
end
