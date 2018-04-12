class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :ingredient_nutrients, dependent: :destroy
  has_many :nutrients, through: :ingredient_nutrients

  def self.find_or_create_by_upc(upc)
    if self.find_by(upc: upc)
      self.find_by(upc: upc)
    else
      usda_request = UsdaRequester.new(upc)
      self.create_from_usda_data(usda_request.data_to_assign) if usda_request.data != ""
    end
  end

  def self.create_from_usda_data(data)
    ingredient = Ingredient.new
    data.each {|key, value|
      ingredient[key] = value unless key == :nutrients
    }
    ingredient.save
    ingredient.build_ingredient_nutrients_from_usda_data(data[:nutrients], ingredient)
    ingredient
  end

  def build_ingredient_nutrients_from_usda_data(data, ingredient)
    data.each {|key, value|
      if nutrient = Nutrient.find_by(usda_name: value[:nutrient_usda_name], storage_unit: value[:nutrient_storage_unit])
        ingredient.ingredient_nutrients.build(
          nutrient_amount_per_ingredient_storage_unit: value[:nutrient_amount_per_ingredient_storage_unit],
          nutrient_storage_unit: value[:nutrient_storage_unit],
          ingredient_storage_unit: ingredient.storage_unit,
          nutrient: nutrient
        )
      end
    }
  end

end
