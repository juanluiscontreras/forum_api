require 'rails_helper'

#con shoulda-matchers puedo escribir los tests en una linea
#https://github.com/thoughtbot/shoulda-matchers

RSpec.describe Question, type: :model do
  # Association test
  # ensure Quesion model has a 1:m relationship with the Answers model
  it { should have_many(:answers).dependent(:destroy) }
  # Validation tests
  # ensure columns title and description are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
