defmodule MinimalServer.Controllers.RegistrationController do
  alias MinimalServer.Contexts.UserRegistration

  def create(%{"user" => %{}} = params) do
    UserRegistration.create(params["user"])
    |> case do
      {:ok, user} ->
        {200, render_user(user)}

      {:error, _error} ->
        {422, render_error("Invalid user!")}
    end
  end

  def create(_) do
    {422, render_error("Invalid params!")}
  end

  defp render_user(user) do
    %{user: user}
    |> Jason.encode!()
  end

  defp render_error(error) do
    %{error: error}
    |> Jason.encode!()
  end
end
