FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "Username#{n}"}
    sequence(:email) { |n| "email_test#{n}@gmail.com"}
    sequence(:password) { |n| "password#{n}"}
  end
end