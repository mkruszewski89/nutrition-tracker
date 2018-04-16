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

end
