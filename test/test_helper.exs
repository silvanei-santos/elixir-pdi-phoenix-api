Mox.defmock(ElixirPdiPhoenixApi.ViaCep.ClientMock, for: ElixirPdiPhoenixApi.ViaCep.ClientBehaviour)

Application.put_env(
  :elixir_pdi_phoenix_api,
  :via_cep_client,
  ElixirPdiPhoenixApi.ViaCep.ClientMock
)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(ElixirPdiPhoenixApi.Repo, :manual)
