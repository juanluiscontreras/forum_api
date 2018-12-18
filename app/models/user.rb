class User < ApplicationRecord
	 # encrypt password
  	has_secure_password

	#model associations
	has_many :questions, dependent: :destroy
	has_many :answers, dependent: :destroy

	#validations
	validates_presence_of :username, :password_digest, :screen_name, :email
	validates_uniqueness_of :username, :email
	validates_length_of :username, :minimum => 2
  	validates_length_of :username, :maximum => 50
end
