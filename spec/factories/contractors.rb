FactoryBot.define do
  factory :contractor do
    name { 'João' }
    sequence(:email) {|i| "contractor#{i}@email.com" }
    category
    cpf { '1234567890' }
    password { '123456' }
  end
end