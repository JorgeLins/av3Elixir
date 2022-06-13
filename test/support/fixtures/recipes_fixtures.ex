defmodule Av3Elixir.RecipesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Av3Elixir.Recipes` context.
  """

  @doc """
  Generate a recipe.
  """
  def recipe_fixture(attrs \\ %{}) do
    {:ok, recipe} =
      attrs
      |> Enum.into(%{
        name: "some name",
        value: 120.5
      })
      |> Av3Elixir.Recipes.create_recipe()

    recipe
  end
end
