class Question < ApplicationRecord
  #model associations
  belongs_to :user, optional: true
  has_one :answer
  has_many :answers, dependent: :destroy

  # validations
  validates_presence_of :title, :description
end
