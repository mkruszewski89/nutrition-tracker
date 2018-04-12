class Recipe < ApplicationRecord
  validates_with RecipeValidator
  attr_accessor :ingredient_join_errors
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_nutrients, dependent: :destroy
  has_many :nutrients, through: :recipe_nutrients
  belongs_to :user
  accepts_nested_attributes_for :recipe_ingredients

  def recipe_ingredients_attributes=(recipe_ingredients_attributes)
    recipe_ingredients.destroy_all
    @ingredient_join_errors = []
    recipe_ingredients_attributes.values.each {|recipe_ingredient_attributes|
      ingredient = recipe_ingredient_set_ingredient(recipe_ingredient_attributes[:ingredient_name], recipe_ingredient_attributes[:ingredient_upc])
      check_unit_mismatch(recipe_ingredient_attributes[:ingredient_storage_unit], ingredient) if ingredient_join_errors.empty?
      recipe_ingredients.build(
        ingredient: ingredient,
        ingredient_amount: recipe_ingredient_attributes[:ingredient_amount],
        ingredient_storage_unit: recipe_ingredient_attributes[:ingredient_storage_unit])
    }
  end

  def recipe_ingredient_set_ingredient(name, upc)
    collect_data_entry_errors(name, upc)
    ingredient = Ingredient.new(name: name, upc: upc)
    if ingredient_join_errors.empty?
      ingredient = Ingredient.find_by(name: name)
      if !ingredient
        ingredient = Ingredient.find_or_create_by_upc(upc)
        if !ingredient
          ingredient = Ingredient.new(name: name, upc: upc)
          @ingredient_join_errors << "UPC #{upc} not found in USDA database"
        end
      end
    end
    ingredient
  end

  def collect_data_entry_errors(name, upc)
    @ingredient_join_errors << "name must be selected or UPC must be entered" if name == "" && upc == ""
    @ingredient_join_errors << "#{name} does not exist in our database. Please select an ingredient from our database or create a new ingredient from UPC" if name != "" && !Ingredient.find_by(name: name)
    @ingredient_join_errors << "UPC #{upc} is an invalid UPC. A valid UPC is 12 digits" if name == "" && upc != "" && upc.length != 12
  end

  def check_unit_mismatch(unit_input, ingredient)
    user_unit = Unit.find_by(name: unit_input)
    ingredient_unit = Unit.find_by(abbreviation: ingredient.storage_unit)
    if user_unit.physical_property != ingredient_unit.physical_property && ingredient.density == 0.0
      @ingredient_join_errors << "Unit is invalid for #{ingredient.name}. #{unit_input} measures #{user_unit.physical_property}. Until this ingredient is confirmed by a site administrator, its unit must measure #{ingredient_unit.physical_property} to fetch USDA data."
    end
  end

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
