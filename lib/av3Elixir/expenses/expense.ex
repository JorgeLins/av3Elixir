defmodule Av3Elixir.Expenses.Expense do
  use Ecto.Schema
  import Ecto.Changeset

  schema "expense" do
    field :name, :string
    field :value, :float

    timestamps()
  end

  @doc false
  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:name, :value])
    |> validate_required([:name, :value])
  end
end
