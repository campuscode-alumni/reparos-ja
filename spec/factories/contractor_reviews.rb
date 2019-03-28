FactoryBot.define do
  factory :contractor_review do
    service_order
    comment { "Muito bom!" }
    rating { 4 }
  end
end
