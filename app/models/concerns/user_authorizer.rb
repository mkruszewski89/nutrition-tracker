class UserAuthorizer < ApplicationAuthorizer

  def sign_up?
    authorize(anyone)
  end

  def create_account?
    authorize(anyone)
  end

  def omniauth?
    authorize(anyone)
  end

  def log_in?
    authorize(anyone)
  end

  def authenticate?
    authorize(anyone)
  end

  def account?
    authorize(owner_or_admin)
  end

  def edit_account?
    authorize(owner_or_admin)
  end

  def update_account?
    authorize(owner_or_admin)
  end

  def my_recipes?
    authorize(owner_or_admin)
  end

  def favorite_recipes?
    authorize(owner_or_admin)
  end

  def progress?
    authorize(owner_or_admin)
  end

  def targets?
    authorize(owner_or_admin)
  end

  def food_log?
    authorize(owner_or_admin)
  end

  def log_out?
    authorize(owner_only)
  end

  def destroy?
    authorize(owner_or_admin)
  end

end
