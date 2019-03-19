FactoryBot.define do
  factory :estimate do
    description { "Reparos Residênciais" }
    location { "São Paulo" }
    service_date { "2019-03-14" }
    day_shift { "Noite" }
    contractor
    user
  end
end
