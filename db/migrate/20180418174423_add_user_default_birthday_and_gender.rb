class AddUserDefaultBirthdayAndGender < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :birthday, :datetime, default: DateTime.new(2000, 1, 1)
    change_column :users, :gender, :datetime, default: 'female'
  end
end
