class User < ApplicationRecord
  has_many :recipes, dependent: :destroy
  has_secure_password
  enum role: [:normal, :admin]

end
