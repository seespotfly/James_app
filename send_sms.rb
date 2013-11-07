require 'rubygems'
require 'twilio-ruby'
 
account_sid = "ACfe33220d3870980954f8d788d6632c7b"
auth_token = "071a19b24d428604c0a4f7ba4cb5b06b"
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "+14159998888" # Your Twilio number
#from = "+19802482173" # Your Twilio number
 
friends = {
"+17046047104" => "Curious George",
"+14155557775" => "Boots",
"+14155551234" => "Virgil"
}
friends.each do |key, value|
  client.account.sms.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
  ) 
  puts "Sent message to #{value}"
end