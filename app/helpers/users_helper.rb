module UsersHelper

  def collect_user_target_progress_for_table_display(user, nutrient_type)
    data = []
    user.recommended_nutrients.each {|recommendation_hash|
      recommendation_hash.each {|nutrient, recommendation|
        if Nutrient.find_by(name: nutrient).nutrient_type == nutrient_type
          data << ['raw single', nutrient]
          data << ['raw single', 'daily progress']
          data << ['raw single', ' / ']
          data << ['raw single', recommendation[0].round(0)]
          data << ['raw single', recommendation[1]]
          data << ['raw single', recommendation[2]] if recommendation[2] == 'limit'
          data << ['new_row'] unless recommendation_hash == user.recommended_nutrients.last
        end
      }
    }
    data
  end

  def collect_food_logs_for_table_display(user)
    data = []
    if user.food_logs[0]
      user.food_logs.each {|food_log|
        data << ["link multiple start", food_log.recipe.name, "recipe_ingredients_path(#{food_log.recipe.id})", :get]
        data << ["raw multiple continue", "logged: #{food_log.date.strftime("%m/%d/%Y")}"]
        data << ['link multiple end', 'delete', "delete_food_log_recipe_path(#{food_log.id})", :delete]
        data << ['raw single', 'Images coming soon']
        data << ["new_row"] unless food_log == user.food_logs.last
      }
    else
      data << ['raw single', 'Nothing Logged Yet!']
    end
    data
  end

end
