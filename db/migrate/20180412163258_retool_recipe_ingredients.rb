class RetoolRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipe_ingredients, :ingredient_amount, :amount_in_recipe
    rename_column :recipe_ingredients, :ingredient_storage_unit, :user_defined_unit
  end
end
