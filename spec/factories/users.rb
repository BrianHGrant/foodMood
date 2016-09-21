require 'ffaker'

FactoryGirl.define do
  factory :user do
    user_name FFaker::Internet.user_name
    email FFaker::Internet.email
    password FFaker::Internet.password
    date_of_birth FFaker::Time.date
  end
  factory(:confirmed_user) do
    after(:create) { |user| user.confirmed_at = Time.now }
  end
end
