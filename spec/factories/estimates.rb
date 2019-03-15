FactoryBot.define do
  factory :estimate do
    description { "MyText" }
    location { "MyString" }
    service_date { "2019-03-14" }
    day_shift { "MyString" }
    contractor { nil }
    user { nil }
  end
end
