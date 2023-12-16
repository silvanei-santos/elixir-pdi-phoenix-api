defmodule ElixirPdiPhoenixApi.Users do
  alias ElixirPdiPhoenixApi.Users.Create
  alias ElixirPdiPhoenixApi.Users.Get

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
end
