defmodule ElixirPdiPhoenixApi.Accounts.Create do
  alias ElixirPdiPhoenixApi.Accounts.Account
  alias ElixirPdiPhoenixApi.Repo
  alias ElixirPdiPhoenixApi.Users

  def call(%{"user_id" => id} = params) do
    with {:ok, _result} <- Users.get(id) do
      params
      |> Account.changeset()
      |> Repo.insert()
    end
  end
end
