class User < ApplicationRecord
  validates_with UserValidator
  belongs_to :nutrition_plan
  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :food_logs, dependent: :destroy
  has_secure_password
  enum role: [:normal, :admin]

  def nutrient_consumption(nutrient, days=0)
    nutrient = Nutrient.find_by(name: nutrient)
    logs = food_logs.collect{|log| log if log.date.to_date >= DateTime.now.to_date - days}.compact
    i = 0
    if !logs.empty?
      logs.each {|log|
        nutrient_amount_in_log = log.recipe.recipe_nutrients.find_by(nutrient: nutrient).try(:amount_in_recipe)
        i += nutrient_amount_in_log if nutrient_amount_in_log
      }
    end
    i
  end

  def nutrition_plan_recommendations
    user_attributes = []
    nutrition_plan.bucket_by.split("|").each {|user_attribute|
      if user_attribute == 'age'
        user_attributes << self.age_bracket
      else
        user_attributes << self.send(user_attribute.to_sym)
      end
    }
    nutrition_plan.unpack_data[user_attributes.join(";")]
  end

  def age_bracket
    case age
    when 0..3
      "0..3"
    when 4..8
      "4..8"
    when 9..13
      "9..13"
    when 14..18
      "14..18"
    when 19..30
      "19..30"
    when 31..51
      "31..50"
    else
      "51..200"
    end
  end

  def age
    now = Time.now.utc.to_date
    age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = '00000000'
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.nutrition_plan = NutritionPlan.all[0]
      user.save!
    end
  end

end
