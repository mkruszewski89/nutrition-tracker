class UsersController < ApplicationController

  def account
    @user = User.find(params[:id])
  end

  def edit_account
    @user = User.find(params[:id])
  end

  def index_recipes
    @user = User.find(params[:id])
  end

  def favorite_recipes
    @user = User.find(params[:id])
  end

  def progress
    @user = User.find(params[:id])
  end

  def targets
    @user = User.find(params[:id])
  end

  def food_log
    @user = User.find(params[:id])
  end

end
