defmodule ElixirPdiPhoenixApi.Users.Get do
  alias Hex.API.User
  alias ElixirPdiPhoenixApi.Users.User
  alias ElixirPdiPhoenixApi.Repo

  def call(%{} = params) do
    case Repo.get_by(User, params) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
