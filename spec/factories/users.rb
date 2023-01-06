FactoryBot.define do
  factory :user do
    name
    password "foobar"
    password_confirmation "foobar"
  end
end