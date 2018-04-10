class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :ingredient_nutrients
  has_many :nutrients, through: :ingredient_nutrients

  # def self.find_or_create_by_upc(upc)
  #   if self.find_by(upc: upc)
  #     self.find_by(upc: upc)
  #   else
  #     usda_request = UsdaRequester.new(upc)
  #     usda_request.data != "" ? self.create_from_usda_data(usda_request.data_to_assign) : self.new(upc: upc)
  #   end
  # end
  #
  # def self.create_from_usda_data(data_to_assign)
  #   ingredient = Ingredient.new
  #   data_to_assign.each {|key, value|
  #     ingredient[key] = value unless key == :nutrients
  #   }
  #   data_to_assign[:nutrients].each {|nutrient_usda_name, nutrient_values|
  #     ingredient_nutrient = IngredientNutrients.new(
  #       ingredient: ingredient
  #       nutrient: Nutrient.find_by(usda_name: nutrient_usda_name)
  #       unit: Unit.find_by(nutrient_values[unit]
  #       amount_per_usda_unit: nutrient_values[amount_per_usda_unit]
  #     )
  #     ingredient_nutrient.save unless ingredient_nutrient.nutrient == nil || ingredient_nutrient.unit == nil
  #   }
  #   ingredient
  # end

end
