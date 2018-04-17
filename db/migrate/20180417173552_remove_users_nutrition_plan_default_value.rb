class RemoveUsersNutritionPlanDefaultValue < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :nutrition_plan_id
    add_column :users, :nutrition_plan_id, :integer
  end
end
