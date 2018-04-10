class ChangeCopperUnitDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column :ingredients, :copper_unit, :string, :default => ""
    change_column :recipes, :copper_unit, :string, :default => ""
  end
end
