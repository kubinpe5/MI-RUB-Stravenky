# This will guess the User class
FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password              "hesloheslo"
    password_confirmation "hesloheslo"
    admin false
    trait :admin do
      admin true
    end
  end
end