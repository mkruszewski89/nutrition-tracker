class AddSlugsToRecipeAndUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :slug, :string
    add_column :recipes, :slug, :string
  end
end
