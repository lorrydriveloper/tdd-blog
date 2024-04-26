FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "First#{n} Last#{n}" }
    sequence(:email) { |n| "user#{n}@test.com" }
  end
end
