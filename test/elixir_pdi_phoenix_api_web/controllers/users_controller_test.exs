defmodule ElixirPdiPhoenixApiWeb.UsersControllerTest do
  use ElixirPdiPhoenixApiWeb.ConnCase

  alias ElixirPdiPhoenixApi.Users
  alias ElixirPdiPhoenixApi.Users.User

  describe "create/2" do
    test "succesfuly create an user", %{conn: conn} do
      params = %{
        name: "João",
        email: "joao@gmail.com",
        cep: "12345678",
        password: "123456"
      }

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
                 "cep" => "12345678"
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
    test "succesfuly delete an user", %{conn: conn} do
      params = %{
        name: "João",
        email: "joao@gmail.com",
        cep: "12345678",
        password: "123456"
      }

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
          "cep" => "12345678"
        }
      }

      assert response == expected_response
    end
  end
end
