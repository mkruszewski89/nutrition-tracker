class Recipe < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_nutrients, dependent: :destroy
  has_many :nutrients, through: :recipe_nutrients
  belongs_to :user
  accepts_nested_attributes_for :recipe_ingredients

  def build_recipe_nutrients
    recipe_nutrients.destroy_all
    recipe_ingredients.each {|recipe_ingredient|
      recipe_ingredient.ingredient.ingredient_nutrients.each {|ingredient_nutrient|
        recipe_ingredient_amount_in_ingredient_storage_unit = transform_amount_to_unit(recipe_ingredient, ingredient_nutrient)
        recipe_ingredient_nutrient_amount = recipe_ingredient_amount_in_ingredient_storage_unit * ingredient_nutrient.nutrient_amount_per_ingredient_storage_unit
        if recipe_nutrient = recipe_nutrients.find_by(recipe: self, nutrient: ingredient_nutrient.nutrient)
          recipe_nutrient.nutrient_amount += recipe_ingredient_nutrient_amount
        else
          recipe_nutrient = recipe_nutrients.build(nutrient_amount: recipe_ingredient_nutrient_amount, nutrient_storage_unit: ingredient_nutrient.nutrient_storage_unit, nutrient: ingredient_nutrient.nutrient)
        end
        recipe_nutrient.save
      }
    }
  end

  def transform_amount_to_unit(recipe_ingredient, nutrient)
    old_amount = recipe_ingredient.ingredient_amount
    old_unit = Unit.find_by(abbreviation: recipe_ingredient.ingredient_storage_unit)
    new_unit = Unit.find_by(abbreviation: nutrient.ingredient_storage_unit)
    old_amount_in_lowest_unit = old_amount * old_unit.lowest_unit_equivalence
    old_amount_in_lowest_unit = transform_physical_property(old_amount_in_lowest_unit, old_unit, recipe_ingredient.ingredient.density) if old_unit.physical_property != new_unit.physical_property
    new_amount = old_amount_in_lowest_unit / new_unit.lowest_unit_equivalence
  end

  def transform_physical_property(amount, unit, density)
    unit.physical_property == 'mass' ? amount * (1/density) : amount * density
  end


end
