defmodule MinimalServer.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/health" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{message: "I'm alive!"}))
  end
end
