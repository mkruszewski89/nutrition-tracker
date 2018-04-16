class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :recipe, uniqueness: {scope: :user}

  def self.toggle_recipe(user, recipe)
    self.find_by(user: user, recipe: recipe) ? self.find_by(user: user, recipe: recipe).destroy : self.create(user: user, recipe: recipe)
  end

end
