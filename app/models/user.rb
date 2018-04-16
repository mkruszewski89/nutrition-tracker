class User < ApplicationRecord
  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :food_logs, dependent: :destroy
  has_secure_password
  enum role: [:normal, :admin]

  def recommended_nutrients
    nutrients = []
    Nutrient.all.each {|nutrient|
      nutrients << {"#{nutrient.name}": [nutrient.send("recommendation_amount_#{recommendation_category}"), nutrient.usda_unit, nutrient.recommendation_type]}
    }
    nutrients
  end

  def age
    now = Time.now.utc.to_date
    age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def recommendation_category
    case age
    when 0..3
      gender + 'I'
    when 4..8
      gender + 'C'
    when 9..13
      gender + 'P'
    when 14..18
      gender + 'T'
    when 19..30
      gender + 'Y'
    when 31..50
      gender + 'A'
    when 51..200
      gender + 'E'
    else
      gender + 'A'
    end
  end

end
