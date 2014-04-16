# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :text_datum, :class => 'TextData' do
    MessageSid "MyString"
    SmsSid "MyString"
    AccountSid "MyString"
    From "MyString"
    To "MyString"
    From "MyString"
    Body "MyString"
    NumMedia "MyString"
    user_id 1
  end
end
