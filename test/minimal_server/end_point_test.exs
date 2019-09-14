defmodule MinimalServer.EndPointTest do
  use ExUnit.Case
  use Plug.Test

  @opts MinimalServer.EndPoint.init([])

  test "handle unknown requests" do
    conn = conn(:get, "/fail")
    conn = MinimalServer.EndPoint.call(conn, @opts)

    assert conn.status == 404
    assert conn.resp_body == "oops... nothing here!"
  end

  test "GET /health" do
    conn = conn(:get, "/health")
    conn = MinimalServer.EndPoint.call(conn, @opts)

    assert conn.status == 200
    assert Jason.decode!(conn.resp_body) == %{"message" => "I'm alive!"}
  end
end
