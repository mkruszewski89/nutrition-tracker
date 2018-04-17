class RemoveRecommendationColumnsFromNutrients < ActiveRecord::Migration[5.1]
  def change
    remove_column :nutrients, :recommendation_type
    remove_column :nutrients, :recommendation_amount_I
    remove_column :nutrients, :recommendation_amount_FC
    remove_column :nutrients, :recommendation_amount_MC
    remove_column :nutrients, :recommendation_amount_FP
    remove_column :nutrients, :recommendation_amount_MP
    remove_column :nutrients, :recommendation_amount_FT
    remove_column :nutrients, :recommendation_amount_MT
    remove_column :nutrients, :recommendation_amount_FY
    remove_column :nutrients, :recommendation_amount_MY
    remove_column :nutrients, :recommendation_amount_FA
    remove_column :nutrients, :recommendation_amount_MA
    remove_column :nutrients, :recommendation_amount_FE
    remove_column :nutrients, :recommendation_amount_ME
  end
end
