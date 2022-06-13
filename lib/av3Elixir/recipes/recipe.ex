defmodule Av3Elixir.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes" do
    field :name, :string
    field :value, :float

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:name, :value])
    |> validate_required([:name, :value])
  end
end
