defmodule MinimalServer.RouterTest do
  use ExUnit.Case
  use Plug.Test

  @opts MinimalServer.EndPoint.init([])

  test "GET /api/health" do
    conn = conn(:get, "/api/health")
    conn = MinimalServer.EndPoint.call(conn, @opts)

    assert conn.status == 200
    assert Poison.decode!(conn.resp_body) == %{"message" => "I'm alive!"}
  end
end
