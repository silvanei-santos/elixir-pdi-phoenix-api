defmodule ElixirPdiPhoenixApi.Accounts do
  alias ElixirPdiPhoenixApi.Accounts.Create
  alias ElixirPdiPhoenixApi.Accounts.Transaction

  defdelegate create(params), to: Create, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
end
