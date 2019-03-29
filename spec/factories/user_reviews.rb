FactoryBot.define do
  factory :user_review do
    user
    service_order
    rating { 1 }
    comment { "MyText" }
  end
end
