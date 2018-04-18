class ChangeUserDefaultGender < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :gender, :string, default: 'female'
  end
end
