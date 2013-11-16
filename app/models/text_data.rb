class TextData < ActiveRecord::Base

belongs_to :user

  def codedate
    ParkingCode.code_for(text_date)
  end

#intended to associate :Body from twilio with text_body in the DB
text_body = params[:Body]

#Code to define the Body of the text as a date
  def text_date
    string = self.text_body
    date = Date.parse(string)
  end

#  def self.text_body
#    text_body.body = body
#    text_body.save
#  end

#  def self.text_date(Body)
#    string = text_date
#    date = Date.parse(string)
#  end

#    if (Date.parse(:body))
#      return codedate
#    else
#      return false
#    end

#    Date.today

end