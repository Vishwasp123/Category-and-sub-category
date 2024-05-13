FactoryBot.define do
  factory :sub_category do
    name { "Women's Clothing" }
    association :category
    
  end
end
