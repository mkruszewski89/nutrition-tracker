module UsersHelper

  def collect_user_recipes_for_table_display(user)
    data = []
    user.recipes.each {|recipe|
      data << ['link', recipe.name, "/users/#{recipe.user.id}/recipes/#{recipe.id}"]
      data << ["new_row"] unless recipe == user.recipes.last
    }
    data
  end

  def collect_user_recommended_nutrients_for_table_display(user, nutrient_type)
    data = []
    user_category = user_category(user)
    recommended_nutrients = Nutrient.all.each {|nutrient|
      if nutrient.nutrient_type == nutrient_type
        data << ["raw", nutrient.name]
        data << ['raw', nutrient.send("recommendation_amount_#{user_category}")]
        data << ['raw', nutrient.usda_unit]
        data << ['raw', 'limit'] if nutrient.recommendation_type == 'limit'
        data << ["new_row"] unless nutrient == Nutrient.last
      end
    }
    data
  end

  def user_category(user)
    age = user_age(user)
    gender = user.gender ? user.gender : 'F'
    cat = case age
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

  def user_age(user)
    dob = user.birthday
    now = Time.now.utc.to_date
    age = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

end
