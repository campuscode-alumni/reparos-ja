FactoryBot.define do
  factory :user do
    sequence(:name) {|i| "Usuário #{i}" }
    sequence(:email) {|i| "user#{i}@email.com" }
    password { '123456' }
  end
end
