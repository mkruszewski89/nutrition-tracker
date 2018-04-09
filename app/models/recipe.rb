class Recipe < ApplicationRecord
  has_many :ingredient_amounts
  has_many :ingredients, through: :ingredient_amounts

  def populate_nutrition
    nutrition_columns = self.class.get_nutrition_columns
    nutrition_columns.each {|column| self[column.to_sym] = 0}
    nutrition_columns.each {|column|
      self.ingredient_amounts.each {|ingredient_amount|
        nutrition_per_usda_unit = ingredient_amount.ingredient.send("#{column}_per_usda_unit")
        ingredient_amount_in_usda_unit = convert_to_usda_unit(ingredient_amount)
        self[column.to_sym] += nutrition_per_usda_unit * ingredient_amount_in_usda_unit
        self["#{column}_unit".to_sym] = ingredient_amount.ingredient.send("#{column}_unit")
      }
    }
    self.save
  end

  def self.get_nutrition_columns
    column_names.collect {|column|
      column unless column == 'id' || column == 'name' || column == 'user_id' || column == 'created_at' || column == 'updated_at' || column[-4..column.length] == 'unit'
    }.compact
  end

  def convert_to_usda_unit(ingredient_amount)
    usda_unit = Unit.find_by(abbreviation: ingredient_amount.ingredient.usda_unit)
    ingredient_amount_in_lowest_unit = ingredient_amount.amount * ingredient_amount.unit.lowest_unit_equivalence
    ingredient_amount_in_lowest_unit = convert_physical_property(ingredient_amount_in_lowest_unit, ingredient_amount) if ingredient_amount.unit.physical_property != usda_unit.physical_property
    ingredient_amount_in_usda_unit = ingredient_amount_in_lowest_unit / usda_unit.lowest_unit_equivalence
  end

  def convert_physical_property(ingredient_amount_in_lowest_unit, ingredient_amount)
    ingredient_amount.unit.physical_property == 'mass' ? ingredient_amount_in_lowest_unit * (1/ingredient_amount.ingredient.density) : ingredient_amount_in_lowest_unit * ingredient_amount.ingredient.density
  end

end
