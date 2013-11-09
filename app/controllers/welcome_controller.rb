class WelcomeController < ApplicationController
  def index
    sender = params[:From]
    friends = {
      "+17046047104" => "Adam Hill",
      "+17046040698" => "Katy Hill"
#    "+14158157775" => "Boots",
#    "+14155551234" => "Virgil"
    } 
#evaluate the content of the incoming text for a date
#    message = params[:body]

    name = friends[sender] || "Mobile Monkey"
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message ParkingCode.message_for(Date.today) 
    end
    render :text => twiml.text
  end
end
