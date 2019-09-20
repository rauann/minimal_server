defmodule MinimalServer.Router.Api do
  use Plug.Router

  alias MinimalServer.Controllers.UsersController

  plug(:match)
  plug(:dispatch)

  post "/users" do
    {status, body} = UsersController.create(conn.body_params)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(status, body)
  end

  get "/users" do
    users = MinimalServer.Repo.all(MinimalServer.User) |> Jason.encode!()

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, users)
  end
end
