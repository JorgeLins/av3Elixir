defmodule Av3Elixir.Repo.Migrations.CreateExpense do
  use Ecto.Migration

  def change do
    create table(:expense) do
      add :name, :string
      add :value, :float

      timestamps()
    end
  end
end
