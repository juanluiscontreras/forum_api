class User < ApplicationRecord
	 # encrypt password
  	has_secure_password

	#model associations
	has_many :questions, dependent: :destroy
	has_many :answers, dependent: :destroy

	#validations
	validates :username, :password_digest, :screen_name, :email, presence: true
	validates :username, :email, uniqueness: true	
	validates :username, length: { in: 2..50 }
end
