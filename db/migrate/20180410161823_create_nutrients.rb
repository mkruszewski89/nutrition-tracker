class CreateNutrients < ActiveRecord::Migration[5.1]
  def change
    create_table :nutrients do |t|
      t.string :name, default: ""
      t.string :usda_name, default: ""
      t.string :nutrient_type, default: ""
      t.string :storage_unit, default: ""
      t.string :recommendation_type, default: ""
      t.float :recommendation_amount_I, default: 0.0
      t.float :recommendation_amount_FC, default: 0.0
      t.float :recommendation_amount_MC, default: 0.0
      t.float :recommendation_amount_FP, default: 0.0
      t.float :recommendation_amount_MP, default: 0.0
      t.float :recommendation_amount_FT, default: 0.0
      t.float :recommendation_amount_MT, default: 0.0
      t.float :recommendation_amount_FY, default: 0.0
      t.float :recommendation_amount_MY, default: 0.0
      t.float :recommendation_amount_FA, default: 0.0
      t.float :recommendation_amount_MA, default: 0.0
      t.float :recommendation_amount_FE, default: 0.0
      t.float :recommendation_amount_ME, default: 0.0
    end
  end
end
