FactoryBot.define do
  factory :user do
    name { Faker::Beer.name }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end