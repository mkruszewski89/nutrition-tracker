class RecipeValidator < ActiveModel::Validator

  def validate(record)
    record.errors[:recipe] << "name can't be blank" if record.name == ""
    if record.ingredient_join_errors && !record.ingredient_join_errors.empty?
      record.ingredient_join_errors.each {|error|
        record.errors[:ingredient] << error
      }
    end
  end

end
