FactoryBot.define do
  factory :user_review do
    user { nil }
    service_order { nil }
    rating { 1 }
    comment { "MyText" }
  end
end
