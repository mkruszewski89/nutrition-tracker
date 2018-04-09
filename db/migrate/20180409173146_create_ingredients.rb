class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name, default: ""
      t.string :ndbno, default: ""
      t.string :upc, default: ""
      t.float :density, default: 0.0
      t.string :usda_unit, default: ""
      t.float :calorie_per_usda_unit, default: 0.0
      t.string :calorie_unit, default: ""
      t.float :protein_per_usda_unit, default: 0.0
      t.string :protein_unit, default: ""
      t.float :carbohydrate_per_usda_unit, default: 0.0
      t.string :carbohydrate_unit, default: ""
      t.float :sugar_per_usda_unit, default: 0.0
      t.string :sugar_unit, default: ""
      t.float :fat_total_per_usda_unit, default: 0.0
      t.string :fat_total_unit, default: ""
      t.float :fat_saturated_per_usda_unit, default: 0.0
      t.string :fat_saturated_unit, default: ""
      t.float :fat_monounsaturated_per_usda_unit, default: 0.0
      t.string :fat_monounsaturated_unit, default: ""
      t.float :fat_polyunsaturated_per_usda_unit, default: 0.0
      t.string :fat_polyunsaturated_unit, default: ""
      t.float :fat_trans_per_usda_unit, default: 0.0
      t.string :fat_trans_unit, default: ""
      t.float :fiber_per_usda_unit, default: 0.0
      t.string :fiber_unit, default: ""
      t.float :cholesterol_per_usda_unit, default: 0.0
      t.string :cholesterol_unit, default: ""
      t.float :sodium_per_usda_unit, default: 0.0
      t.string :sodium_unit, default: ""
      t.float :vitamin_a_per_usda_unit, default: 0.0
      t.string :vitamin_a_unit, default: ""
      t.float :vitamin_c_per_usda_unit, default: 0.0
      t.string :vitamin_c_unit, default: ""
      t.float :calcium_per_usda_unit, default: 0.0
      t.string :calcium_unit, default: ""
      t.float :iron_per_usda_unit, default: 0.0
      t.string :iron_unit, default: ""
      t.timestamps
    end
  end
end
