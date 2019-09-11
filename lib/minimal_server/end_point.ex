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

  forward("/api", to: MinimalServer.Router.Api)

  get "/health" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{message: "I'm alive!"}))
  end

  match _ do
    send_resp(conn, 404, "oops... nothing here!")
  end
end
