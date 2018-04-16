class RecipesController < ApplicationController

  def all_recipes
    @user = current_user
    @recipes = Recipe.all
  end

  def new_full
    @user = current_user
    @recipe = Recipe.new
  end

  def new_full_action
    @user = current_user
    @recipe = Recipe.new(recipe_params)
    @user.recipes << @recipe
    if @recipe.save
      @recipe.build_recipe_nutrients
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show_ingredients
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
  end

  def show_instructions
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
  end

  def show_nutrition
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
  end

  def edit
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
  end

  def edit_action
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    if @recipe.update(recipe_params)
      @recipe.build_recipe_nutrients
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def toggle_favorite
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:recipe_id])
    Favorite.toggle_recipe(@user, @recipe)
    redirect_to recipe_ingredients_path(@recipe)
  end

  def create_log
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:recipe_id])
    FoodLog.create(user: @user, recipe: @recipe, date: DateTime.now)
    redirect_to recipe_ingredients_path(@recipe)
  end

  def destroy_log
    @user = User.find(params[:user_id])
    FoodLog.find(params[:food_log_id]).destroy
    redirect_to user_food_log_path(@user)
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
