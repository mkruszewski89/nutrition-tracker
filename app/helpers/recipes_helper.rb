module RecipesHelper

  def collect_recipe_nutrients_for_table_display(recipe, nutrient_type)
    data = []
    nutrients = Nutrient.all.collect{|nutrient| [["header", nutrient.name], ["raw single", nutrient.usda_unit], nutrient] if nutrient.nutrient_type == nutrient_type}.compact
    nutrients.each {|nutrient|
      recipe_nutrient = recipe.recipe_nutrients.find_by(nutrient: nutrient[2])
      data << nutrient[0]
      recipe_nutrient ? data << ["raw single", recipe_nutrient.amount_in_recipe.round(1)] : data << ["raw single", 0.0]
      data << nutrient[1]
      data << ["new_row"] unless nutrient == nutrients.last
    }
    data
  end

  def collect_recipe_ingredients_for_table_display(recipe)
    data = []
    if recipe.recipe_ingredients[0]
      data << ['header', 'Amount']
      data << ['header', 'Unit']
      data << ['header', 'Ingredient']
      data << ['new_row']
      recipe.recipe_ingredients.each {|recipe_ingredient|
        data << ["raw single", recipe_ingredient.amount_in_recipe]
        data << ["raw single", recipe_ingredient.user_defined_unit]
        data << ["raw single", recipe_ingredient.ingredient.name]
        data << ["new_row"] unless recipe_ingredient == recipe.recipe_ingredients.last
      }
    else
      data << ['raw single', 'No Ingredients!']
    end
    data
  end

  def collect_recipes_for_table_display(recipes)
    data = []
    if recipes[0]
      recipes.each {|recipe|
        data << ["link multiple start", recipe.name, "recipe_ingredients_path(#{recipe.id})", :get]
        data << ["raw multiple continue", "by: #{recipe.user.name}"]
        data << ["raw multiple end", "cals: #{recipe.nutrient_amount('calorie').round(0)}"]
        data << ["raw single", "Images coming soon"]
        data << ["new_row"] unless recipe == recipes.last
      }
    else
      data << ['raw single', 'No Recipes!']
    end
    data
  end

end
