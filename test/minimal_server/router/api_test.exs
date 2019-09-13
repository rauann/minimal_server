defmodule MinimalServer.Router.ApiTest do
  use ExUnit.Case
  use Plug.Test

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(MinimalServer.Repo)
  end

  @opts MinimalServer.EndPoint.init([])

  test "when valid params" do
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
