defmodule ElixirPdiPhoenixApi.Users.Delete do
  alias Ecto.Multi

  alias ElixirPdiPhoenixApi.Users.User
  alias ElixirPdiPhoenixApi.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil ->
        {:error, :not_found}

      user ->
        Multi.new()
        |> delete_account(user)
        |> delete_user(user)
        |> Repo.transaction()
        |> handle_transaction()
    end
  end

  defp delete_account(multi, user) do
    case Repo.preload(user, :account) do
      %User{account: nil} -> multi
      %User{account: account} -> Multi.delete(multi, :delete_user_account, account)
    end
  end

  defp delete_user(multi, user), do: Multi.delete(multi, :delete_user, user)

  defp handle_transaction({:ok, %{delete_user: user}}), do: {:ok, user}
  defp handle_transaction({:error, _op, reason, _}), do: {:error, reason}
end
