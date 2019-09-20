defmodule MinimalServer.Controllers.UsersController do
  use Helpers.RenderHelper

  alias MinimalServer.Contexts.UserRegistration

  def create(%{"user" => %{}} = params) do
    params["user"]
    |> UserRegistration.create()
    |> case do
      {:ok, user} ->
        {200, render(%{user: user})}

      {:error, changeset} ->
        {422, render(%{error: changeset})}
    end
  end

  def create(_) do
    {422, render(%{error: "Invalid params!"})}
  end
end
