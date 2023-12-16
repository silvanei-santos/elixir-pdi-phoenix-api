defmodule ElixirPdiPhoenixApi.Users do
  alias ElixirPdiPhoenixApi.Users.Create

  defdelegate create(params), to: Create, as: :call
end
