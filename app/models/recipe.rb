class Recipe < ApplicationRecord
  has_many :ingredient_amounts
  has_many :ingredients, through: :ingredient_amounts
end
