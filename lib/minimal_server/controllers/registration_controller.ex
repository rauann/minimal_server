defmodule MinimalServer.Controllers.RegistrationController do
  alias MinimalServer.User
  alias MinimalServer.Repo

  @invalid_params_error %{error: "Invalid params!"}

  def new(%{"user" => %{}} = params) do
    changeset = User.registration_changeset(%User{}, params["user"])

    case Repo.insert(changeset) do
      # the return should be a Repo.get() in somewhere else
      {:ok, user} -> {200, Poison.encode!(user)}
      {:error, _} -> {422, Poison.encode!(@invalid_params_error)}
    end
  end

  def new(_) do
    {422, Poison.encode!(@invalid_params_error)}
  end
end
