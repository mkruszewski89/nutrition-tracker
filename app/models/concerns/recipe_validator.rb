class RecipeValidator < ActiveModel::Validator

  def validate(record)
    record.errors[:name] << "of recipe can't be blank" if record.name == ""
  end

end
