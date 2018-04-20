class User < ApplicationRecord
	has_secure_password validations: false
  has_many :posts
  has_many :comments
end
