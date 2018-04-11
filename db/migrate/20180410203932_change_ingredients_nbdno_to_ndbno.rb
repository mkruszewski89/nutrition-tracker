class ChangeIngredientsNbdnoToNdbno < ActiveRecord::Migration[5.1]
  def change
    rename_column :ingredients, :nbdno, :ndbno
  end
end
