class RecipeNutrient < ApplicationRecord
  belongs_to :recipe
  belongs_to :nutrient

end
