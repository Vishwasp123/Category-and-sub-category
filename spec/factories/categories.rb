FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end
end
