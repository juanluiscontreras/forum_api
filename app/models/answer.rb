class Answer < ApplicationRecord
  #model associations

  belongs_to :question
  belongs_to :user, optional: true

  #validations
  validates_presence_of :content
end
