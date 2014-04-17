# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization do
    name "Packard Place"
    relationship

    factory :tenant do
      name "Priceless Misc"
      relationship factory: :desk
    end
  end
end
