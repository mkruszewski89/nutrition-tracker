class UsersController < ApplicationController

  def sign_up
    @user = User.new
  end

  def create_account
    @user = User.new(user_params)
    @user.nutrition_plan << NutritionPlan.all[0]
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_account_path(@user)
    else
      render :sign_up
    end
  end

  def log_in
    @user = User.new
  end

  def authenticate
    @user = User.new(user_params) unless @user = User.find_by(email: params[:user][:email])
    if !@user.persisted?
      @user.errors[:email] << "#{params[:user][:email]} not found"
      render :log_in
      return
    end
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to(user_account_path(@user))
    else
      @user.errors[:password] << "for #{params[:user][:email]} doesn't match our records"
      render :log_in
    end
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

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :birthday,
      :gender,
      :role,
      :nutrition_plan,
      :password,
      :password_confirmation)
  end

end
