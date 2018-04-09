class CreateIngredientAmounts < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredient_amounts do |t|
      t.float :amount, default: 0.0
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :unit_id
      t.timestamps
    end
  end
end
