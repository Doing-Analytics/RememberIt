FactoryBot.define do
  factory :team do
    name { Faker::Kpop.boy_bands }
    description { Faker::Marketing.buzzwords }
  end
end