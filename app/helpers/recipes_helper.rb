module RecipesHelper

  def collect_recipe_nutrients_for_table_display(recipe, nutrient_type)
    data = []
    recipe_nutrients = recipe.recipe_nutrients.collect {|recipe_nutrient|
      recipe_nutrient if recipe_nutrient.nutrient.nutrient_type == nutrient_type
    }.compact
    recipe_nutrients.each {|recipe_nutrient|
      data << ["raw", recipe_nutrient.nutrient.name]
      data << ["raw", recipe_nutrient.amount_in_recipe.round(1)]
      data << ["raw", recipe_nutrient.nutrient.usda_unit]
      data << ["new_row"] unless recipe_nutrient == recipe_nutrients.last
    }
    data
  end

  def collect_recipe_ingredients_for_table_display(recipe)
    data = []
    recipe.recipe_ingredients.each {|recipe_ingredient|
      data << ["raw", recipe_ingredient.amount_in_recipe]
      data << ["raw", recipe_ingredient.user_defined_unit]
      data << ["raw", recipe_ingredient.ingredient.name]
      data << ["new_row"] unless recipe_ingredient == recipe.recipe_ingredients.last
    }
    data
  end

  def collect_recipe_and_user_links_for_table_display(recipes)
    data = []
    recipes.each {|recipe|
      data << ["link", recipe.name, "/users/#{recipe.user.id}/recipes/#{recipe.id}"]
      data << ["link", recipe.user.name, "/users/#{recipe.user.id}"]
      data << ["new_row"] unless recipe == recipes.last
    }
    data
  end

end
