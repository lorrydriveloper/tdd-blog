FactoryBot.define do
  factory :page do
    user { create(:user) }
    sequence(:title) { |n| "Page Title #{n}" }
    sequence(:summary) { |n| "<p>Page Summary #{n}</p>" }
    sequence(:content) { |n| "<p>Page Content #{n}</p>" }
    created_at { Time.zone.now }
    published { false }

    trait :published do
      published { true }
    end
  end
end
