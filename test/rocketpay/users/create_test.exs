defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

    alias Rocketpay.User
    alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Pedro",
        password: "123456",
        nickname: "bisteca",
        email: "pedro@banana.com",
        age: 20
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Pedro", age: 20, id: ^user_id} = user
    end

    test "when there are invalid params are valid, returns an user" do
      params = %{
        name: "Pedro",
        password: "123456",
        nickname: "bisteca",
        email: "pedro@banana.com",
        age: 14
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{age: ["must be greater than or equal to 18"]}

      assert errors_on(changeset) == expected_response
    end
  end

end
