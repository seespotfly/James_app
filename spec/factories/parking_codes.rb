# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:code){ |i| i.to_s.ljust(8, "0") }
  factory :parking_code do
    code
    codedate "2013-10-24"
  end
end
