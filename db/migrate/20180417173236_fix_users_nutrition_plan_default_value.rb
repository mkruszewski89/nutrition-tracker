class FixUsersNutritionPlanDefaultValue < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :nutrition_plan_id
    add_column :users, :nutrition_plan_id, :integer, default: NutritionPlan.all[0].id
  end
end
