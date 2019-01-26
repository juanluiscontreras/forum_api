class Answer < ApplicationRecord
  #model associations

  belongs_to :question
  belongs_to :user, optional: true

  #validations
  validates :content, presence:true
end
