class Nutrient < ApplicationRecord
  has_many :ingredient_nutrients
  has_many :ingredients, through: :ingredient_nutrients
  has_many :recipe_nutrients
  has_many :recipes, through: :nutrients

end
