defmodule ElixirPdiPhoenixApiWeb.AccountsController do
  use ElixirPdiPhoenixApiWeb, :controller

  alias ElixirPdiPhoenixApi.Accounts
  alias ElixirPdiPhoenixApi.Accounts.Account

  action_fallback ElixirPdiPhoenixApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Account{} = account} <- Accounts.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, transaction} <- Accounts.transaction(params) do
      conn
      |> put_status(:ok)
      |> render(:transaction, transaction: transaction)
    end
  end
end
