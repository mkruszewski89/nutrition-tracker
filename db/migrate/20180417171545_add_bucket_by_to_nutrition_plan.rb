class AddBucketByToNutritionPlan < ActiveRecord::Migration[5.1]
  def change
    add_column :nutrition_plans, :bucket_by, :string
  end
end
