class CreateFoodLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :food_logs do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.datetime :date

      t.timestamps
    end
  end
end
