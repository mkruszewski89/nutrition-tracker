class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def new_action
    @user = User.find(params[:id])
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      @recipe.build_recipe_nutrients
      redirect_to recipe_path(@user, @recipe)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
  end

  def edit_action
    raise params
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name,
      recipe_ingredients: [
        :ingredient_amount,
        :ingredient_name,
        :ingredient_upc,
        :ingredient_storage_unit]
    )
  end

end
