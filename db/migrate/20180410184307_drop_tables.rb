class DropTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :ingredients
    drop_table :recipes
    drop_table :ingredient_amounts
  end
end
