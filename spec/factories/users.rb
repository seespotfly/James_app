# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Test User"
    phone_number "11238675309"
    organization
  end
end
