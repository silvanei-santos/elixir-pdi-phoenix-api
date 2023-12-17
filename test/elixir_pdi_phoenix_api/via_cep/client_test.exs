defmodule ElixirPdiPhoenixApi.ViaCep.ClientTest do
  use ExUnit.Case, async: true

  alias ElixirPdiPhoenixApi.ViaCep.Client

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  describe "call/1" do
    test "successfully returns cep info", %{bypass: bypass} do
      cep = "83406330"
      body = ~s({
        "cep": "83406-330",
        "logradouro": "Rua Maria Izabel Tosin",
        "complemento": "",
        "bairro": "Monza",
        "localidade": "Colombo",
        "uf": "PR",
        "ibge": "4105805",
        "gia": "",
        "ddd": "41",
        "siafi": "7513"
      })

      expected_response =
        {:ok,
         %{
           "bairro" => "Monza",
           "cep" => "83406-330",
           "complemento" => "",
           "ddd" => "41",
           "gia" => "",
           "ibge" => "4105805",
           "localidade" => "Colombo",
           "logradouro" => "Rua Maria Izabel Tosin",
           "siafi" => "7513",
           "uf" => "PR"
         }}

      Bypass.expect(bypass, "GET", "/#{cep}/json", fn conn ->
        conn
        |> Plug.Conn.put_resp_content_type("application/json")
        |> Plug.Conn.resp(200, body)
      end)

      response =
        bypass.port
        |> endpoint_url()
        |> Client.call(cep)

      assert response == expected_response
    end
  end

  defp endpoint_url(port), do: "http://localhost:#{port}"
end
