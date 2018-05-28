class Recipe < ApplicationRecord
  validates_with RecipeValidator
  attr_accessor :all_ingredient_errors
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_nutrients, dependent: :destroy
  has_many :nutrients, through: :recipe_nutrients
  has_many :favorites, dependent: :destroy
  has_many :food_logs
  belongs_to :user
  accepts_nested_attributes_for :recipe_ingredients

# RecipeIngredient Builder

  def recipe_ingredients_attributes=(recipe_ingredients_attributes)
    self.recipe_ingredients.destroy_all
    @all_ingredient_errors = []
    recipe_ingredients_attributes.values.each {|attributes|
      ingredient = set_ingredient(attributes)
      self.recipe_ingredients.build(amount_in_recipe: attributes[:amount_in_recipe], user_defined_unit: attributes[:user_defined_unit], ingredient: ingredient)
    }
  end

  # RecipeIngredient helpers

    def set_ingredient(attributes)
      ingredient = Ingredient.where("name = ? OR upc = ?", attributes[:ingredient_name], attributes[:ingredient_upc])[0]
      ingredient = try_to_create_ingredient(attributes[:ingredient_name], attributes[:ingredient_upc]) if !ingredient
      @all_ingredient_errors << "invalid unit for #{ingredient.name}: Until confirmed by a site administrator, this ingredient's unit must measure #{Unit.find_by(abbreviation: ingredient.usda_unit).physical_property} to fetch USDA data." if ingredient && ingredient.density == 0.0 && !compatible_units?(attributes[:user_defined_unit], ingredient.usda_unit)
      ingredient = Ingredient.new(name: attributes[:ingredient_name], upc: attributes[:ingredient_upc]) if !ingredient
      ingredient
    end

    def try_to_create_ingredient(name, upc)
      ingredient_errors = []
      ingredient_errors << "name must be selected or UPC must be entered" if name == "" && upc == ""
      ingredient_errors << "#{name} does not exist in our database. Please select an ingredient from our database or create a new ingredient from UPC" if name != ""
      ingredient_errors << "UPC #{upc} is an invalid UPC. A valid UPC is 12 digits" if name == "" && upc != "" && upc.length != 12
      ingredient = Ingredient.find_or_create_by_upc(upc) if ingredient_errors.empty?
      ingredient_errors << "UPC #{upc} not found in USDA database" if ingredient_errors.empty? && !ingredient
      @all_ingredient_errors << ingredient_errors
      ingredient_errors.empty? ? ingredient : nil
    end

    def compatible_units?(unit_1, unit_2)
      unit_1 = Unit.where("name = ? OR abbreviation = ?", unit_1, unit_1)[0]
      unit_2 = Unit.where("name = ? OR abbreviation = ?", unit_2, unit_2)[0]
      unit_1.physical_property == unit_2.physical_property
    end

# RecipeNutrient builder

  def build_recipe_nutrients
    self.recipe_nutrients.destroy_all
    recipe_ingredients.each {|recipe_ingredient|
      ingredient_amount_in_recipe_as_usda_unit = transform_amount_to_unit(recipe_ingredient.amount_in_recipe, recipe_ingredient.user_defined_unit, recipe_ingredient.ingredient.usda_unit, recipe_ingredient.ingredient.density)
      recipe_ingredient.ingredient.ingredient_nutrients.each {|ingredient_nutrient|
        nutrient_amount_in_recipe_ingredient = ingredient_amount_in_recipe_as_usda_unit * ingredient_nutrient.amount_per_ingredient_usda_unit
        if recipe_nutrient = self.recipe_nutrients.find_by(recipe: self, nutrient: ingredient_nutrient.nutrient)
          recipe_nutrient.amount_in_recipe += nutrient_amount_in_recipe_ingredient
        else
          recipe_nutrient = self.recipe_nutrients.build(amount_in_recipe: nutrient_amount_in_recipe_ingredient, nutrient: ingredient_nutrient.nutrient)
        end
        recipe_nutrient.save
      }
    }
  end

  # RecipeNutrient helpers

    def transform_amount_to_unit(old_amount, old_unit, new_unit, density)
      old_unit = Unit.where("name = ? OR abbreviation = ?", old_unit, old_unit)[0]
      new_unit = Unit.where("name = ? OR abbreviation = ?", new_unit, new_unit)[0]
      old_amount_in_old_unit_lowest_equivalent = old_amount * old_unit.lowest_unit_equivalence
      old_amount_in_old_unit_lowest_equivalent = transform_lowest_unit_physical_property(old_amount_in_old_unit_lowest_equivalent, old_unit, density) if old_unit.physical_property != new_unit.physical_property
      new_amount = old_amount_in_old_unit_lowest_equivalent / new_unit.lowest_unit_equivalence
    end

    def transform_lowest_unit_physical_property(amount, unit, density)
      unit.physical_property == 'mass' ? amount * (1/density) : amount * density
    end

  # Other
    def self.most_calories
      most_calories = 0
      recipe_with_most_calories = nil
      self.all.each {|recipe|
        if recipe.nutrient_amount('calorie') > most_calories
          recipe_with_most_calories = recipe
          most_calories = recipe.nutrient_amount('calorie')
        end
      }
      return recipe_with_most_calories
    end

    def nutrient_amount(nutrient)
      recipe_nutrients.find_by(nutrient: Nutrient.find_by(name: nutrient)).amount_in_recipe
    end

end
