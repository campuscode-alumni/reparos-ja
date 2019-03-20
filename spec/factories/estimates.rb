FactoryBot.define do
  factory :estimate do
    description { "Trocar encanamento da cozinha" }
    location { "São Paulo" }
    service_date { "2019-03-14" }
    day_shift { "Tarde" }
    contractor
    user
  end
end
