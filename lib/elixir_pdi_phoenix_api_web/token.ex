defmodule ElixirPdiPhoenixApiWeb.Token do
  alias ElixirPdiPhoenixApiWeb.Endpoint
  alias Phoenix.Token

  @sign_salt "pdi_api"

  def sign(user), do: Token.sign(Endpoint, @sign_salt, %{user_id: user.id})

  def verify(token), do: Token.verify(Endpoint, @sign_salt, token, max_age: 86400)
end
