module UsersHelper

  def collect_account_information_for_table_display(user)
    data = []
    data << ['header', 'Name']
    data << ['raw single', user.name]
    data << ['new_row']
    data << ['header', 'Email']
    data << ['raw single', user.email]
    data << ['new_row']
    data << ['header', 'Birthday']
    data << ['raw single', user.birthday.to_date]
    data << ['new_row']
    data << ['header', 'Gender']
    data << ['raw single', user.gender]
    data
  end

  def collect_user_progress_for_table_display(user, nutrient_type, days=0)
    data = []
    user.nutrition_plan_recommendations.each{|nutrient_array|
      nutrient = Nutrient.find_by(name: nutrient_array[0])
      if nutrient.nutrient_type == nutrient_type
        data << ['header', nutrient_array[0]]
        nutrient_type == 'macronutrient' ? data << ['raw single', user.nutrient_consumption(nutrient.name, days).to_i] : data << ['raw single', user.nutrient_consumption(nutrient.name, days).to_f.round(1)]
        data << ['raw single', ' / ']
        nutrient_type == 'macronutrient' ? data << ['raw single', nutrient_array[2].to_i] : data << ['raw single', nutrient_array[2].to_f.round(1)]
        data << ['raw single', nutrient.usda_unit]
        data << ['raw single', nutrient_array[1]] if nutrient_array[1] == "ul"
        data << ['new_row'] unless nutrient_array == user.nutrition_plan_recommendations.last
      end
    }
    data
  end

  def collect_user_nutrition_plan_targets_for_table_display(user, nutrient_type, time_frame=1)
    data = []
    user.nutrition_plan_recommendations.each{|nutrient_array|
      nutrient = Nutrient.find_by(name: nutrient_array[0])
      if nutrient.nutrient_type == nutrient_type
        data << ['header', nutrient_array[0]]
        nutrient_type == 'macronutrient' ? data << ['raw single', nutrient_array[2].to_i] : data << ['raw single', nutrient_array[2].to_f.round(1)]
        data << ['raw single', nutrient.usda_unit]
        data << ['raw single', nutrient_array[1]]
        data << ['new_row'] unless nutrient_array == user.nutrition_plan_recommendations.last
      end
    }
    data
  end

  def collect_user_food_logs_for_table_display(user)
    data = []
    if user.food_logs[0]
      user.food_logs.each {|food_log|
        data << ["link multiple start", food_log.recipe.name, "/#{food_log.recipe.slug}/ingredients", :get]
        data << ["raw multiple continue", "logged: #{food_log.date.strftime("%m/%d/%Y")}"]
        data << ['link multiple end', 'delete', "/#{food_log.id}/food-log", :delete]
        data << ['raw single', 'Images coming soon']
        data << ["new_row"] unless food_log == user.food_logs.last
      }
    else
      data << ['raw single', 'Nothing Logged Yet!']
    end
    data
  end

end
