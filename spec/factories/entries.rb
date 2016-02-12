FactoryGirl.define do
  factory :entry do
    comment "Lorem Ipsum"
    association :activity
  end
end
