class WelcomeController < ApplicationController
  def index

    sender = params[:From]
    user = User.find_sender(sender[1..11])

    if user.nil?
      render :text => sms_message("You are not registered to request parking codes.")

      #Successfull Text
    else
      if user.under_limit?
        text_data = TextData.from_twilio(params)
        text_data.user = user
        text_data.company_id = user.company_id
        text_data.save
        render :text => sms_message("The parking code for #{text_data.text_date} is #{text_data.codedate}. You have #{user.texts_left} free codes left.")
      else
        text_data = TextData.from_twilio(params)
        text_data.user = user
        text_data.save
        render :text => sms_message("The parking code for #{text_data.text_date} is #{text_data.codedate}. You're #{user.texts_left.abs} over your limit.")

      end
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
