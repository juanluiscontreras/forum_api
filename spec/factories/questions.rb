FactoryBot.define do
  factory :question do
  	#al ponerlo entre {} bloque, cada vez q llamo se generan de nuevo
    title { Faker::StarWars.character }
    description { Faker::StarWars.character }
    status false
    user
    created_at { Faker::Number.number(10) }
    updated_at { Faker::Number.number(10) }
    after :question do |question|
      create :answer, question: question
    end
  end
end 