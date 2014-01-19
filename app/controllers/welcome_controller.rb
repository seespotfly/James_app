class WelcomeController < ApplicationController
  def index

    sender = params[:From]

    user = User.find_sender(sender[1..11])
#this code will help to debug whats happening in Heroku 
#    puts "[DEBUG]" + [sender, User.all.collect{ |u| u.phone_number }].inspect
    if user.nil?
      render :text => sms_message("You are not registered to request parking codes.")

#This bit is BROKEN
#NEW CODE warning if code limit is reached
    else
      if User.under_code_limit?
        text_data = TextData.from_twilio(params)
        text_data.user = user
        text_data.save
        render :text => sms_message("The parking code for #{text_data.text_date} is #{text_data.codedate}")

      else
        render :text => sms_message("You've reached the limit of free codes for the month.")

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
