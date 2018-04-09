class Ingredient < ApplicationRecord

  def self.find_or_create_by_upc(upc)
    if self.find_by(upc: upc)
      self.find_by(upc: upc)
    else
      usda_request = UsdaRequester.new(upc)
      usda_request.data != "" ? self.create_from_usda_data(usda_request.data_to_assign) : self.new(upc: upc)
    end
  end

  def self.create_from_usda_data(data_to_assign)
    ingredient = Ingredient.new
    data_to_assign.each {|key, value|
      ingredient[key] = value unless key == :nutrients
    }
    data_to_assign[:nutrients].each {|nutrient_key, nutrient_value|
      ingredient[nutrient_key] = nutrient_value
    }
    ingredient.save
    ingredient
  end

end
