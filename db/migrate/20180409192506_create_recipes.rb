class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name, default: ""
      t.float :calorie, default: 0.0
      t.string :calorie_unit, default: ""
      t.float :protein, default: 0.0
      t.string :protein_unit, default: ""
      t.float :carbohydrate, default: 0.0
      t.string :carbohydrate_unit, default: ""
      t.float :sugar, default: 0.0
      t.string :sugar_unit, default: ""
      t.float :fat_total, default: 0.0
      t.string :fat_total_unit, default: ""
      t.float :fat_saturated, default: 0.0
      t.string :fat_saturated_unit, default: ""
      t.float :fat_monounsaturated, default: 0.0
      t.string :fat_monounsaturated_unit, default: ""
      t.float :fat_polyunsaturated, default: 0.0
      t.string :fat_polyunsaturated_unit, default: ""
      t.float :fat_trans, default: 0.0
      t.string :fat_trans_unit, default: ""
      t.float :fiber, default: 0.0
      t.string :fiber_unit, default: ""
      t.float :cholesterol, default: 0.0
      t.string :cholesterol_unit, default: ""
      t.float :sodium, default: 0.0
      t.string :sodium_unit, default: ""
      t.float :vitamin_a, default: 0.0
      t.string :vitamin_a_unit, default: ""
      t.float :vitamin_c, default: 0.0
      t.string :vitamin_c_unit, default: ""
      t.float :calcium, default: 0.0
      t.string :calcium_unit, default: ""
      t.float :iron, default: 0.0
      t.string :iron_unit, default: ""
      t.timestamps
    end
  end
end
