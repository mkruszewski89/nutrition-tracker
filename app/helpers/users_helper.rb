module UsersHelper

  def collect_user_recipes_for_table_display(user)
    data = []
    user.recipes.each {|recipe|
      data << ['link multiple start', recipe.name, "/users/#{recipe.user.id}/recipes/#{recipe.id}"]
      data << ['raw multiple end', "cals: #{recipe.nutrient_amount('calorie').round(0)}"]
      data << ["new_row"] unless recipe == user.recipes.last
    }
    data
  end

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

end
