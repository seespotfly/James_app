# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :parking_code do
    code { 8.times.collect { |i| rand(10).to_s }.join("") }
    codedate "2013-10-24"
  end
end
