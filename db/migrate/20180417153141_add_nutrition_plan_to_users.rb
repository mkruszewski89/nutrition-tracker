class AddNutritionPlanToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nutrition_plan, :string, default: "USDA Dietary Guidelines"
  end
end
