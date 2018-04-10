class CreateIngredientNutrients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredient_nutrients do |t|
      t.integer :ingredient_id
      t.integer :nutrient_id
      t.string :ingredient_storage_unit, default: ""
      t.string :nutrient_storage_unit, default: ""
      t.float :nutrient_amount_per_ingredient_storage_unit, default: 0.0

      t.timestamps
    end
  end
end
