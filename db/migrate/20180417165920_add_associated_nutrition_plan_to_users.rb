class AddAssociatedNutritionPlanToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :nutrition_plan
    add_column :users, :nutrition_plan_id, :integer, default: 1
  end
end
