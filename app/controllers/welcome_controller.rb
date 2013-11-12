class WelcomeController < ApplicationController
  def index
    sender = params[:From]

    user = User.find_sender(sender)

    if user.nil?
      #render :text => sms_message("You are not registered to request parking codes.")
      render :text => sms_message(sender)

    else
      render :text => sms_message(ParkingCode.message_for(Date.today))
    end
  end

  private

  def sms_message(txt)
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message txt
    end
    twiml.text
  end
end
