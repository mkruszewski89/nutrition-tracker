class RetoolIngredients < ActiveRecord::Migration[5.1]
  def change
    rename_column :ingredients, :storage_unit, :usda_unit
    rename_column :ingredients, :ndbno, :usda_no
  end
end
