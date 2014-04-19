# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :relationship do
    name "Owner"
    text_count 100

    factory :desk  do
      name "Desk"
      text_count 1
    end

  end

end
