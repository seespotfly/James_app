class WelcomeController < ApplicationController
  def index
      text_data = TextData.from_twilio(params)
      text_data.save
      render :text => sms_message(text_data.outgoing_sms_body)
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
