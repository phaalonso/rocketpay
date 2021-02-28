defmodule RocketpayWeb.AccountsView do
  alias Rocketpay.Account
  alias Rocketpay.Account.Transaction.Response, as: TransactionResponse

  def render("update.json", %{account: %Account{
    id: account_id, balance: balance
  }}) do
    %{
      message: "Balance changes successfully",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end

  def render("transaction.json", %{transaction: %TransactionResponse{
    to_account: to_account, from_account: from_account
  }}) do
    %{
      message: "Transaction done successfully",
      transaction: %{
        to_account: %{
          id: to_account.id,
          balance: to_account.balance
        },
        from_account: %{
          id: from_account.id,
          balance: from_account.balance
        }
      }
    }
  end
end
