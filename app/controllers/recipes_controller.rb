class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def new_action
    raise params
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

end
