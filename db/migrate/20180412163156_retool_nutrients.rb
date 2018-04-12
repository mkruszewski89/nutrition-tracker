class RetoolNutrients < ActiveRecord::Migration[5.1]
  def change
    rename_column :nutrients, :storage_unit, :usda_unit
  end
end
