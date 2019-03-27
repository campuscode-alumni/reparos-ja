FactoryBot.define do
  factory :contractor_review do
    service_order { nil }
    comment { "MyText" }
    rating { 1 }
  end
end
