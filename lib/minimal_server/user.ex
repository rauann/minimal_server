defmodule MinimalServer.User do
  use Ecto.Schema

  import Ecto.Changeset

  @derive {Jason.Encoder, except: [:__meta__, :id]}

  schema "users" do
    field(:email, :string)
    field(:password, :string)
    field(:username, :string)
  end

  def registration_changeset(user, params \\ %{}) do
    user
    |> cast(params, [:email, :password, :username])
    |> validate_required([:email, :password, :username])
  end
end
