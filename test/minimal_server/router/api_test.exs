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

    assert conn.status == 200
    assert conn.resp_body == Jason.encode!(params)
  end

  test "when invalid params" do
    params = %{
      username: "Jacob",
      email: "jake@jake.jake",
      password: "jakejake"
    }

    conn = conn(:post, "/api/users", params)
    conn = MinimalServer.EndPoint.call(conn, @opts)

    assert conn.status == 422
    assert Jason.decode!(conn.resp_body) == %{"error" => "Invalid params!"}
  end

  test "when invalid user" do
    params = %{
      user: %{
        username: "Jacob",
        email: "jake@jake.jake",
        password: ""
      }
    }

    conn = conn(:post, "/api/users", params)
    conn = MinimalServer.EndPoint.call(conn, @opts)

    assert conn.status == 422
    assert Jason.decode!(conn.resp_body) == %{"error" => "Invalid user!"}
  end
end
