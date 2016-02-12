FactoryGirl.define do
  factory :activity do
    title Faker::Company.catch_phrase
    description Faker::Lorem.sentence
  end
end
