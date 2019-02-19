require 'rails_helper'

RSpec.describe User, type: :model do
  
  # Association test
  # ensure User model has a 1:m relationship with the Questions model
  it { should have_many(:questions).dependent(:destroy) }
  # ensure User model has a 1:m relationship with the Questions model
  it { should have_many(:answers).dependent(:destroy) }

  # Validation tests
  # ensure columns username passqord screen name and email are present before saving
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:screen_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password_digest) }
end

