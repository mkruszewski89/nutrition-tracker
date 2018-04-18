class UserValidator < ActiveModel::Validator

  def validate(record)
    record.errors[:password] << "must be at least 8 characters" if !record.password || record.password.length < 8
    record.errors[:name] << "can't be blank" if record.name == ""
    record.errors[:email] << "can't be blank" if record.email == ""
    if user = User.find_by(email: record.email)
      record.errors[:email] << "is already in use" unless user == record
    end
  end

end
