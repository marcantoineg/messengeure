defmodule Messengeure.Accounts do
    import Ecto.Changeset
    alias Messengeure.Accounts.User
    alias Messengeure.Repo

    def create_user(params) do
        register_changeset(params)
        |> Repo.insert
    end

    def register_changeset(params \\ %{}) do
        %User{}
        |> cast(params, [:username, :email, :password])
        |> validate_required([:username, :email, :password])
        |> unique_constraint(:email)
        |> unique_constraint(:username)
    end
end