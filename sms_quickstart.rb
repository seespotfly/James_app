require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
 
get '/sms-quickstart' do
  sender = params[:From]
  friends = {
#    "+17046047104" => "Adam Hill",
#    "+17046040698" => "Katy Hill",
#    "+14158157775" => "Boots",
#    "+14155551234" => "Virgil"
  }
  name = friends[sender] || "Mobile Monkey"
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Hello, #{name}. Thanks for the message."
  end
  twiml.text
end