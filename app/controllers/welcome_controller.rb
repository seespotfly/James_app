class WelcomeController < ApplicationController
  def index

    sender = params[:From]

    user = User.find_sender(sender[1..11])
#this code will help to debug whats happening in Heroku 
#    puts "[DEBUG]" + [sender, User.all.collect{ |u| u.phone_number }].inspect
    if user.nil?
      render :text => sms_message("You are not registered to request parking codes.")

#NEW CODE warning if code limit is reached
    elsif user.code_limit?
    render :text => sms_message("You've reached your limit of free codes for the month.")

    else
      text_data = TextData.from_twilio(params)
      text_data.user = user
      text_data.save
#      puts "[DEBUG]" + text_data.inspect
      render :text => sms_message("The parking code for #{text_data.text_date} is #{text_data.codedate}")
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
