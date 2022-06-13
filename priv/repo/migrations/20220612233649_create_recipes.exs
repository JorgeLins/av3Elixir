defmodule Av3Elixir.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :name, :string
      add :value, :float

      timestamps()
    end
  end
end
