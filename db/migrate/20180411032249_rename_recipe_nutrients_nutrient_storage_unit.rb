class RenameRecipeNutrientsNutrientStorageUnit < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipe_nutrients, :nutritient_storage_unit, :nutrient_storage_unit
  end
end
