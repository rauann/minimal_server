defmodule MinimalServer.Contexts.UserRegistration do
  alias MinimalServer.User
  alias MinimalServer.Repo

  def create(params) do
    %User{}
    |> User.registration_changeset(params)
    |> Repo.insert()
  end
end
