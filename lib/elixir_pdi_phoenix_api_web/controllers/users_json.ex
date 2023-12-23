defmodule ElixirPdiPhoenixApiWeb.UsersJSON do
  alias ElixirPdiPhoenixApi.Users.User

  def create(%{user: user}) do
    %{
      message: "User created with success!",
      data: data(user)
    }
  end

  def login(%{token: token}) do
    %{
      message: "User authenticated with success!",
      bearer: token
    }
  end

  def get(%{user: user}), do: %{data: data(user)}
  def update(%{user: user}), do: %{message: "User updated with success!", data: data(user)}
  def delete(%{user: user}), do: %{data: data(user)}

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      cep: user.cep
    }
  end
end
