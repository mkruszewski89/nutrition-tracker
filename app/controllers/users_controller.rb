class UsersController < ApplicationController

  def authenticate

  end

  def account
    @user = User.find(params[:user_id])
  end

  def edit_account
    @user = User.find(params[:user_id])
  end

  def my_recipes
    @user = User.find(params[:user_id])
  end

  def favorite_recipes
    @user = User.find(params[:user_id])
  end

  def progress
    @user = User.find(params[:user_id])
  end

  def targets
    @user = User.find(params[:user_id])
  end

  def food_log
    @user = User.find(params[:user_id])
  end

end
