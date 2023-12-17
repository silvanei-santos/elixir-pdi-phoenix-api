defmodule ElixirPdiPhoenixApi.Users.Delete do
  alias ElixirPdiPhoenixApi.Users.User
  alias ElixirPdiPhoenixApi.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> Repo.delete(user)
    end
  end
end
