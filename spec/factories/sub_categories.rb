FactoryBot.define do
  factory :sub_category do
    name { Faker::Lorem.word }
    association :category
    
  end
end
