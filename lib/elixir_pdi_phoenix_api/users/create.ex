defmodule ElixirPdiPhoenixApi.Users.Create do
  alias ElixirPdiPhoenixApi.Users.User
  alias ElixirPdiPhoenixApi.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
