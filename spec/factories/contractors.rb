FactoryBot.define do
  factory :contractor do
    name { 'João' }
    email { 'mail@teste.com' }
    category
    cpf { '1234567890' }
    password { '123456' }
  end
end