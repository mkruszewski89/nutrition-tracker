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
    @user.recipes << @recipe
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
    @user = User.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    if @recipe.update(recipe_params)
      @recipe.build_recipe_nutrients
      redirect_to recipe_path(@user, @recipe)
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name,
      recipe_ingredients_attributes: [
        :amount_in_recipe,
        :ingredient_name,
        :ingredient_upc,
        :user_defined_unit]
    )
  end

end
