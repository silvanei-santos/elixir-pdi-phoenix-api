defmodule ElixirPdiPhoenixApiWeb.AccountsJSON do
  alias ElixirPdiPhoenixApi.Accounts.Account

  def create(%{account: account}) do
    %{
      message: "Account created with success!",
      data: data(account)
    }
  end

  def transaction(%{transaction: %{withdraw: from_account, deposit: to_account}}) do
    %{
      message: "transaction completed success!",
      from_account: data(from_account),
      to_account: data(to_account)
    }
  end

  defp data(%Account{} = account) do
    %{
      id: account.id,
      user_id: account.user_id,
      balance: account.balance
    }
  end
end
