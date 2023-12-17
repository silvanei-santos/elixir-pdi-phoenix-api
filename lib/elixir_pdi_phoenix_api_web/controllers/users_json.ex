defmodule ElixirPdiPhoenixApiWeb.UsersJSON do
  alias ElixirPdiPhoenixApi.Users.User

  def create(%{user: user}) do
    %{
      message: "User criated with success!",
      data: data(user)
    }
  end

  def get(%{user: user}), do: %{data: data(user)}
  def update(%{user: user}), do: %{message: "User updated with success!", data: data(user)}
  def delete(%{user: user}), do: %{data: data(user)}

  defp data(%User{} = user) do
    %{
      id: user.id,
      cep: user.cep,
      email: user.email,
      name: user.name
    }
  end
end
