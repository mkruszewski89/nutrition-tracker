class CreateRecipeNutrients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_nutrients do |t|
      t.integer :recipe_id
      t.integer :nutrient_id
      t.float :nutrient_amount, default: 0.0
      t.string :nutritient_storage_unit, default: ""

      t.timestamps
    end
  end
end
