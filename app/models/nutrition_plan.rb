class NutritionPlan < ApplicationRecord
  has_many :users

  def unpack_data
    data = {}
    split_buckets = buckets.split("|")
    split_nutrients = nutrients.split("|")
    split_recommendation_type = recommendation_type.split("|")
    split_amounts = amounts.split("|")
    b = 0
    split_buckets.each {|bucket|
      data[bucket] = []
      split_split_amounts = split_amounts[b].split(";")
      n = 0
      split_nutrients.each {|nutrient|
        data[bucket] << [nutrient, split_recommendation_type[n], split_split_amounts[n]]
        n += 1
      }
      b += 1
    }
    data
  end

end
