defmodule ElixirPdiPhoenixApiWeb.UsersController do
  use ElixirPdiPhoenixApiWeb, :controller

  alias ElixirPdiPhoenixApi.Users
  alias ElixirPdiPhoenixApi.Users.User

  action_fallback ElixirPdiPhoenixApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
end
