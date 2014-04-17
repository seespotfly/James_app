# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :text_datum, :class => 'TextData' do
    message_sid "SMf66bd2cac5a17bd90fd4f0bd1d09a45a"
    sms_sid "SMf66bd2cac5a17bd90fd4f0bd1d09a45a"
    account_sid "AC5ffe531a92521556f4543ea4318825a9"
    text_to "+19802482173"
    text_from "+17046047104"
    text_body ""
    num_media "0"
    user
    text_success true
    after(:build){ |td| td.organization = td.user.organization }
  end
end
