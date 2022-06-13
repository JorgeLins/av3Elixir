defmodule Av3ElixirWeb.ExpenseLive.Index do
  use Av3ElixirWeb, :live_view

  alias Av3Elixir.Expenses
  alias Av3Elixir.Expenses.Expense

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :expense_collection, list_expense())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Editar despesa")
    |> assign(:expense, Expenses.get_expense!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Nova despesa")
    |> assign(:expense, %Expense{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Despesas")
    |> assign(:expense, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    expense = Expenses.get_expense!(id)
    {:ok, _} = Expenses.delete_expense(expense)

    {:noreply, assign(socket, :expense_collection, list_expense())}
  end

  defp list_expense do
    Expenses.list_expense()
  end
end
