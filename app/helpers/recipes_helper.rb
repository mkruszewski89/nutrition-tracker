module RecipesHelper

  def collect_recipe_nutrients_for_table_display(recipe, nutrient_type)
    data = []
    recipe_nutrients = recipe.recipe_nutrients.collect {|recipe_nutrient|
      recipe_nutrient if recipe_nutrient.nutrient.nutrient_type == nutrient_type
    }.compact
    recipe_nutrients.each {|recipe_nutrient|
      data << ["raw single", recipe_nutrient.nutrient.name]
      data << ["raw single", recipe_nutrient.amount_in_recipe.round(1)]
      data << ["raw single", recipe_nutrient.nutrient.usda_unit]
      data << ["new_row"] unless recipe_nutrient == recipe_nutrients.last
    }
    data
  end

  def collect_recipe_ingredients_for_table_display(recipe)
    data = []
    recipe.recipe_ingredients.each {|recipe_ingredient|
      data << ["raw single", recipe_ingredient.amount_in_recipe]
      data << ["raw single", recipe_ingredient.user_defined_unit]
      data << ["raw single", recipe_ingredient.ingredient.name]
      data << ["new_row"] unless recipe_ingredient == recipe.recipe_ingredients.last
    }
    data
  end

  def collect_recipes_for_table_display(recipes)
    data = []
    recipes.each {|recipe|
      data << ["link multiple start", recipe.name, "/users/#{recipe.user.id}/recipes/#{recipe.id}"]
      data << ["raw multiple continue", "by: #{recipe.user.name}"]
      data << ["raw multiple end", "cals: #{recipe.nutrient_amount('calorie').round(0)}"]
      data << ["new_row"] unless recipe == recipes.last
    }
    data
  end

end
