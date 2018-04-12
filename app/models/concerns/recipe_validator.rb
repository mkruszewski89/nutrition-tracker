class RecipeValidator < ActiveModel::Validator

  def validate(record)
    record.errors[:recipe] << "name can't be blank" if record.name == ""
    if record.all_ingredient_errors && !record.all_ingredient_errors.empty?
      record.all_ingredient_errors.flatten.each {|error|
        record.errors[:ingredient] << error
      }
    end
  end

end
