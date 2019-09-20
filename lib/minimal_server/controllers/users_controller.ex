defmodule MinimalServer.Controllers.UsersController do
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

  defp render(%{error: %Ecto.Changeset{} = changeset}) do
    %{
      error:
        Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
          Enum.reduce(opts, msg, fn {key, value}, acc ->
            String.replace(acc, "%{#{key}}", to_string(value))
          end)
        end)
    }
    |> Jason.encode!()
  end

  defp render(%{error: _} = error) do
    error
    |> Jason.encode!()
  end

  defp render(user) do
    user
    |> Jason.encode!()
  end
end
