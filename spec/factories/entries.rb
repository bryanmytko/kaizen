FactoryGirl.define do
  factory :entry do
    comment Faker::Lorem.sentence
    association :activity
  end
end
