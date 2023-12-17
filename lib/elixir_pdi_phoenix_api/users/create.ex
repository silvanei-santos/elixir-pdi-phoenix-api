defmodule ElixirPdiPhoenixApi.Users.Create do
  alias ElixirPdiPhoenixApi.Users.User
  alias ElixirPdiPhoenixApi.Repo
  alias ElixirPdiPhoenixApi.ViaCep.Client, as: ViaCepClient

  def call(%{"cep" => cep} = params) do
    with {:ok, _result} <- client().call(cep) do
      params
      |> User.changeset()
      |> Repo.insert()
    end
  end

  defp client() do
    Application.get_env(:elixir_pdi_phoenix_api, :via_cep_client, ViaCepClient)
  end
end
