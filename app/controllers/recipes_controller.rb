class RecipesController < ApplicationController
  before_action :find_or_new_recipe
  before_action :set_current_user

  def all_recipes
    @recipes = Recipe.all
  end

  def new_full
  end

  def create_full
    @user.recipes << @recipe
    if @recipe.save
      @recipe.build_recipe_nutrients
      redirect_to recipe_ingredients_path(@recipe)
    else
      render :new_full
    end
  end

  def ingredients
  end

  def instructions
  end

  def nutrition
  end

  def edit_full
  end

  def update_full
    if @recipe.update(recipe_params)
      @recipe.build_recipe_nutrients
      redirect_to recipe_ingredients_path(@recipe)
    else
      render :new_full
    end
  end

  def destroy_full
    @user = @recipe.user
    @recipe.destroy
    redirect_to user_recipes_all_path(@user)
  end

  def toggle_favorite
    Favorite.toggle_recipe(@user, @recipe)
    redirect_back(fallback_location: root_path)
  end

  def create_food_log
    FoodLog.create(user: @user, recipe: @recipe, date: DateTime.now)
    redirect_back(fallback_location: root_path)
  end

  def destroy_food_log
    FoodLog.find(params[:food_log_id]).destroy
    redirect_back(fallback_location: root_path)
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

  def find_or_new_recipe
    if params[:recipe_id] && Recipe.exists?(params[:recipe_id])
      @recipe = Recipe.find(params[:recipe_id])
    elsif params[:recipe]
      @recipe = Recipe.new(recipe_params)
    else
      @recipe = Recipe.new
    end
  end

  def set_current_user
    @user = current_user
  end

end
