FactoryBot.define do
  factory :user do
    username { Faker::Lorem.characters(10) }
    password 'foobar234423'
    screen_name { Faker::Lorem.characters(10) }
    sequence(:email) {|n| "user#{n}@mail.com" }
    created_at { Faker::Number.number(10) }
    updated_at { Faker::Number.number(10) }
  end
end