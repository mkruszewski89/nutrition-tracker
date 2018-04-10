class CreateRecipeV10 < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name, default: ""
      t.integer :user_id

      t.timestamps
    end
  end
end
