class RecipeAuthorizer < ApplicationAuthorizer

  def all_recipes?
    authorize(anyone)
  end

  def new_full?
    authorize(any_user)
  end

  def create_full?
    authorize(any_user)
  end

  def ingredients?
    authorize(anyone)
  end

  def instructions?
    authorize(anyone)
  end

  def nutrition?
    authorize(anyone)
  end

  def edit_full?
    authorize(owner_or_admin)
  end

  def update_full?
    authorize(owner_or_admin)
  end

  def destroy_full?
    authorize(owner_or_admin)
  end

  def toggle_favorite?
    authorize(any_user)
  end

  def create_food_log?
    authorize(any_user)
  end

  def destroy_food_log?
    authorize(any_user)
  end

end
