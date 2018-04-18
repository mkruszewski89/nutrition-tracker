class UsersController < ApplicationController

  def sign_up
    @user = User.new
  end

  def create_account
    @user = User.new(user_params)
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
      redirect_to("/#{@user.slug}/account")
    else
      @user.errors[:password] << "for #{params[:user][:email]} doesn't match our records"
      render :log_in
    end
  end

  def account
    @user = User.find_by(slug: params[:user_slug])
  end

  def edit_account
    @user = User.find_by(slug: params[:user_slug])
  end

  def update_account
    @user = User.find_by(slug: params[:user_slug])
    if @user.update(user_params)
      redirect_to("/#{@user.slug}/account")
    else
      render :edit_account
    end
  end

  def my_recipes
    @user = User.find_by(slug: params[:user_slug])
  end

  def favorite_recipes
    @user = User.find_by(slug: params[:user_slug])
  end

  def progress
    @user = User.find_by(slug: params[:user_slug])
  end

  def targets
    @user = User.find_by(slug: params[:user_slug])
  end

  def food_log
    @user = User.find_by(slug: params[:user_slug])
  end

  def log_out
    session.delete :user_id
    redirect_to("/log-in")
  end

  def destroy
    @user = User.find_by(slug: params[:user_slug])
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

end
