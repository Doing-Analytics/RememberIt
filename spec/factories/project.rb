FactoryBot.define do
  factory :project do
    team

    title { Faker::Kpop.girl_groups }
    description { Faker::Marketing.buzzwords }
  end
end