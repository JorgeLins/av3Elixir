defmodule Av3ElixirWeb.RecipeLive.FormComponent do
  use Av3ElixirWeb, :live_component

  alias Av3Elixir.Recipes

  @impl true
  def update(%{recipe: recipe} = assigns, socket) do
    changeset = Recipes.change_recipe(recipe)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"recipe" => recipe_params}, socket) do
    changeset =
      socket.assigns.recipe
      |> Recipes.change_recipe(recipe_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"recipe" => recipe_params}, socket) do
    save_recipe(socket, socket.assigns.action, recipe_params)
  end

  defp save_recipe(socket, :edit, recipe_params) do
    case Recipes.update_recipe(socket.assigns.recipe, recipe_params) do
      {:ok, _recipe} ->
        {:noreply,
         socket
         |> put_flash(:info, "Receita atualizado com sucesso")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_recipe(socket, :new, recipe_params) do
    case Recipes.create_recipe(recipe_params) do
      {:ok, _recipe} ->
        {:noreply,
         socket
         |> put_flash(:info, "Receita criada com sucesso")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
