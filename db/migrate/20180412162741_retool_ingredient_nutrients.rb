class RetoolIngredientNutrients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredient_nutrients, :ingredient_storage_unit
    remove_column :ingredient_nutrients, :nutrient_storage_unit
    rename_column :ingredient_nutrients, :nutrient_amount_per_ingredient_storage_unit, :amount_per_ingredient_usda_unit
  end
end
