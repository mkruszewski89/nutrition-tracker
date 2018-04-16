module UsersHelper

  def collect_user_recipes_for_table_display(user)
    data = []
    user.recipes.each {|recipe|
      data << ['link', recipe.name, "/users/#{recipe.user.id}/recipes/#{recipe.id}"]
      data << ["new_row"] unless recipe == user.recipes.last
    }
    data
  end

  def collect_user_target_progress_for_table_display(user, nutrient_type)
    data = []
    user.recommended_nutrients.each {|recommendation_hash|
      recommendation_hash.each {|nutrient, recommendation|
        if Nutrient.find_by(name: nutrient).nutrient_type == nutrient_type
          data << ['raw', nutrient]
          data << ['raw', 'daily progress']
          data << ['raw', ' / ']
          data << ['raw', recommendation[0].round(0)]
          data << ['raw', recommendation[1]]
          data << ['raw', recommendation[2]] if recommendation[2] == 'limit'
          data << ['new_row'] unless recommendation_hash == user.recommended_nutrients.last
        end
      }
    }
    data
  end

end
