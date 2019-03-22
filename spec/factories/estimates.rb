FactoryBot.define do
  factory :estimate do
    title {'Instalação de Chuveiro'}
    description { 'Reparos Residênciais' }
    location { 'São Paulo' }
    service_date { '2019-03-14' }
    day_shift { 'Noite' }
    contractor
    user
  end

  trait :with_response do
    total_hours {'2'}
    material_fee {'100.00'}
    visit_fee {'50.00'}
    service_fee {'150.00'}
    material_list {'Chuveiro, fio, fita isolante, veda rosca'} 
  end

  trait :requested_by_user do
    status {:requested}
  end

  trait :approved_by_contractor do
    status {:approved_contractor}
  end
end