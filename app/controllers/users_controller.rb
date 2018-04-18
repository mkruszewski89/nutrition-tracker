class UsersController < ApplicationController
  before_action :find_or_new_user

  def sign_up
  end

  def create_account
    @user.nutrition_plan = NutritionPlan.all[0]
    if @user.save
      @user.create_slug
      session[:user_id] = @user.id
      redirect_to("/#{@user.slug}/account")
    else
      render :sign_up
    end
  end

  def log_in
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
      redirect_to("/#{@user.slug}/account")
    else
      @user.errors[:password] << "for #{params[:user][:email]} doesn't match our records"
      render :log_in
    end
  end

  def account
  end

  def edit_account
  end

  def update_account
    if @user.update(user_params)
      @user.create_slug
      redirect_to("/#{@user.slug}/account")
    else
      render :edit_account
    end
  end

  def my_recipes
  end

  def favorite_recipes
  end

  def progress
  end

  def targets
  end

  def food_log
  end

  def log_out
    session.delete :user_id
    redirect_to("/log-in")
  end

  def destroy
    session.delete :user_id if session[:user_id] == @user.id
    @user.destroy
    redirect_to("/log-in")
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :slug,
      :email,
      :birthday,
      :gender,
      :role,
      :nutrition_plan,
      :password,
      :password_confirmation)
  end

  def find_or_new_user
    if params[:user_slug] && User.find_by(slug: params[:user_slug])
      @user = User.find_by(slug: params[:user_slug])
    elsif params[:user]
      @user = User.new(user_params)
    else
      @user = User.new
    end
  end

end
