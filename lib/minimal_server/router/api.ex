defmodule MinimalServer.Router.Api do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  post "/users" do
    {status, body} =
      case conn.body_params do
        %{"user" => %{"email" => _, "password" => _, "username" => _}} = user ->
          {200, Poison.encode!(user)}

        _ ->
          {422, Poison.encode!(%{error: "ERROR!"})}
      end

    send_resp(conn, status, body)
  end
end
