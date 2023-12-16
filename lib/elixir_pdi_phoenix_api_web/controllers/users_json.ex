defmodule ElixirPdiPhoenixApiWeb.UsersJSON do
  alias ElixirPdiPhoenixApi.Users.User

  def create(%{user: user}) do
    %{
      message: "User criated with success!",
      data: data_render(user)
    }
  end

  defp data_render(%User{} = user) do
    %{
      id: user.id,
      cep: user.cep,
      email: user.email,
      name: user.name
    }
  end
end
