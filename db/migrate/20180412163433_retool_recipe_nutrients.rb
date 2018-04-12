class RetoolRecipeNutrients < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipe_nutrients, :nutrient_storage_unit
    rename_column :recipe_nutrients, :nutrient_amount, :amount_in_recipe
  end
end
