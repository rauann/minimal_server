defmodule MinimalServer.Router.Api do
  use Plug.Router

  alias MinimalServer.Controllers.RegistrationController

  plug(:match)
  plug(:dispatch)

  post "/users" do
    {status, body} = RegistrationController.new(conn.body_params)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(status, body)
  end
end
