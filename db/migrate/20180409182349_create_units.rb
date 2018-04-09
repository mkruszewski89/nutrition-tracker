class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.string :name, default: ""
      t.string :lowest_unit, default: ""
      t.float :lowest_unit_equivalence, default: 0.0
      t.string :abbreviation, default: ""
      t.string :physical_property, default: ""
      t.timestamps
    end
  end
end
