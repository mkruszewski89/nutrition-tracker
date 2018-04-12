class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :ingredient_nutrients, dependent: :destroy
  has_many :nutrients, through: :ingredient_nutrients

  def self.find_or_create_by_upc(upc)
    ingredient = self.find_by(upc: upc)
    if !ingredient
      usda_request = UsdaRequester.new(upc)
      ingredient = self.create_from_usda_data(usda_request.data_to_assign) if usda_request.data != ""
    end
    ingredient
  end

  def self.create_from_usda_data(data)
    ingredient = Ingredient.new
    data.each {|key, value|
      ingredient[key] = value unless key == :nutrients
    }
    ingredient.build_ingredient_nutrients_from_usda_data(data[:nutrients], ingredient)
    ingredient.save if ingredient.ingredient_nutrients[0]
    ingredient.persisted? ? ingredient : nil
  end

  def build_ingredient_nutrients_from_usda_data(data, ingredient)
    data.each {|key, value|
      if nutrient = Nutrient.find_by(usda_name: value[:nutrient_usda_name], usda_unit: value[:nutrient_usda_unit])
        ingredient.ingredient_nutrients.build(amount_per_ingredient_usda_unit: value[:nutrient_amount_per_ingredient_usda_unit], nutrient: nutrient)
      end
    }
  end

end
