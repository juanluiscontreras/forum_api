FactoryBot.define do
  factory :answer do
  	#al ponerlo entre {} bloque, cada vez q llamo se generan de nuevo
    question
    content { Faker::StarWars.character }
    user
    created_at { Faker::Number.number(10) }
    updated_at { Faker::Number.number(10) }
  end
end