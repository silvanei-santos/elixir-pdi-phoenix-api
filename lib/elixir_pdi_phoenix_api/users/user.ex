defmodule ElixirPdiPhoenixApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias ElixirPdiPhoenixApi.Accounts.Account
  alias Ecto.Changeset

  @required_params [:name, :password, :email, :cep]
  @required_params_update [:name, :email, :cep]

  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :cep, :string
    has_one :account, Account

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> do_validate(@required_params)
    |> add_password_hash()
  end

  def changeset(user, params) do
    user
    |> cast(params, @required_params)
    |> do_validate(@required_params_update)
    |> add_password_hash()
  end

  defp do_validate(changeset, fields) do
    changeset
    |> validate_required(fields)
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cep, is: 8)
  end

  defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, %{password_hash: Argon2.hash_pwd_salt(password)})
  end

  defp add_password_hash(changeset), do: changeset
end
