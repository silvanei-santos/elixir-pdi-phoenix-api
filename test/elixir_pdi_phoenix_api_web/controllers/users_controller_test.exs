defmodule ElixirPdiPhoenixApiWeb.UsersControllerTest do
  use ElixirPdiPhoenixApiWeb.ConnCase

  import Mox

  alias ElixirPdiPhoenixApi.Users
  alias ElixirPdiPhoenixApi.Users.User

  setup do
    user_params = %{
      "name" => "João",
      "email" => "joao@gmail.com",
      "cep" => "83406330",
      "password" => "123456"
    }

    via_cep_response_body = %{
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
    }

    {:ok, %{user_params: user_params, via_cep_response_body: via_cep_response_body}}
  end

  describe "create/2" do
    test "succesfuly create an user", %{
      conn: conn,
      user_params: params,
      via_cep_response_body: body
    } do
      expect(ElixirPdiPhoenixApi.ViaCep.ClientMock, :call, fn "83406330" ->
        {:ok, body}
      end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
               "message" => "User created with success!",
               "data" => %{
                 "id" => _id,
                 "name" => "João",
                 "email" => "joao@gmail.com",
                 "cep" => "83406330"
               }
             } = response
    end

    test "when there are invalid params, return an error", %{conn: conn} do
      params = %{
        name: nil,
        email: "joao@gmail.com",
        cep: "12",
        password: "123456"
      }

      expect(ElixirPdiPhoenixApi.ViaCep.ClientMock, :call, fn "12" ->
        {:ok, ""}
      end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{"cep" => ["should be 8 character(s)"], "name" => ["can't be blank"]}
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "succesfuly delete an user", %{
      conn: conn,
      user_params: params,
      via_cep_response_body: body
    } do
      expect(ElixirPdiPhoenixApi.ViaCep.ClientMock, :call, fn "83406330" ->
        {:ok, body}
      end)

      {:ok, %User{id: id}} = Users.create(params)

      response =
        conn
        |> delete(~p"/api/users/#{id}")
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "id" => id,
          "name" => "João",
          "email" => "joao@gmail.com",
          "cep" => "83406330"
        }
      }

      assert response == expected_response
    end
  end
end
