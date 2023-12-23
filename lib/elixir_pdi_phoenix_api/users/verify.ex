defmodule ElixirPdiPhoenixApi.Users.Verify do
  alias ElixirPdiPhoenixApi.Users

  def call(%{"email" => email, "password" => password}) do
    case Users.get(%{email: email}) do
      {:ok, user} -> verify(user, password)
      {:error, _} = error -> error
    end
  end

  defp verify(user, password) do
    case Argon2.verify_pass(password, user.password_hash) do
      true -> {:ok, user}
      false -> {:error, :unauthorizes}
    end
  end
end
