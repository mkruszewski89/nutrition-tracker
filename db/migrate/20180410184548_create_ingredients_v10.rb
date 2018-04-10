class CreateIngredientsV10 < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name, default: ""
      t.string :storage_unit, default: ""
      t.float :density, default: 0.0
      t.string :upc, default: ""
      t.string :nbdno, default: ""

      t.timestamps
    end
  end
end
