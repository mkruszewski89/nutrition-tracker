class CreateRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.float :ingredient_amount
      t.string :ingredient_storage_unit

      t.timestamps
    end
  end
end
