require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  # Association test
  # ensure an answer record belongs to a single question record
  it { should belong_to(:question) }
  # ensure an answer record belongs to a single user record
  it { should belong_to(:user) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:content) }
end
