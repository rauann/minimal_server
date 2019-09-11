defmodule MinimalServer.Router.ApiTest do
  use ExUnit.Case
  use Plug.Test

  @opts MinimalServer.EndPoint.init([])

  test "" do
    params = %{
      user: %{
        username: "Jacob",
        email: "jake@jake.jake",
        password: "jakejake"
      }
    }

    conn = conn(:post, "/api/users", params)
    conn = MinimalServer.EndPoint.call(conn, @opts)

    IO.inspect(Poison.decode!(conn.resp_body))
  end
end
