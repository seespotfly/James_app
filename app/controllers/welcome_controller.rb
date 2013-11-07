class WelcomeController < ApplicationController
  def index
    sender = params[:From]
    friends = {
      "+17046047104" => "Adam Hill",
      "+17046040698" => "Katy Hill"
#    "+14158157775" => "Boots",
#    "+14155551234" => "Virgil"
    } 
    name = friends[sender] || "Mobile Monkey"
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message ParkingCode.message_for(Date.today) 
#    r.Message "Hello, #{name}. Thanks for the message."
    end
    render :text => twiml.text
  end
end
