defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Rocketpay.{Account, User}
  alias Rocketpay.Users.Create
  alias RocketpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Pedro",
      password: "123456",
      nickname: "bisteca",
      email: "pedro@banana.com",
      age: 20
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = Create.call(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created", 
      user: %{
        account: %{
          balance: Decimal.new("0.00"), 
          id: account_id, 
        },
        id: user_id, 
        name: "Pedro", 
        nickname: "bisteca"
      }
    }

    assert expected_response == response
  end
end
