defmodule ElixirPdiPhoenixApi.Users do
  alias ElixirPdiPhoenixApi.Users.Update
  alias ElixirPdiPhoenixApi.Users.Create
  alias ElixirPdiPhoenixApi.Users.Get
  alias ElixirPdiPhoenixApi.Users.Delete
  alias ElixirPdiPhoenixApi.Users.Verify

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
  defdelegate login(id), to: Verify, as: :call
end
