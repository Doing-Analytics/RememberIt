FactoryBot.define do
  factory :team_member do
    user
    team

    trait :leader do
      role { 'leader' }
    end
  end
end