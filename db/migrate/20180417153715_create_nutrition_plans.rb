class CreateNutritionPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :nutrition_plans do |t|
      t.string :name
      t.string :description
      t.string :buckets
      t.string :nutrients
      t.string :recommendation_type
      t.string :amounts

      t.timestamps
    end
  end
end
