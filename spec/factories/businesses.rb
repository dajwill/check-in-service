include BCrypt

FactoryGirl.define do
  factory :business do
    name "Joe's Average Pub"
    business_type "Restaurant"
    code 1111
    # password_hash BCrypt::Password.create('test')
    # password 'test'

    trait :mexican_restaurant do
      name "Taco King"
      business_type "Restaurant"
      code 2222
      password_hash BCrypt::Password.create('test')
    end

    trait :pizza do
      name "Pizza King"
      business_type "Restaurant"
      code 3333
    end
  end
end
