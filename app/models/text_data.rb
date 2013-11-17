class TextData < ActiveRecord::Base

belongs_to :user

  def codedate
    ParkingCode.code_for(text_date)
  end

#Code to define the Body of the text as a date
  def text_date
    string = self.text_body
    date = Date.parse(string)
  end

#Code to associate :Body from twilio with text_body
  def self.from_twilio(hash)
    td = TextData.new
    td.text_body = hash[:Body]
    td.message_sid = hash[:MessageSid]
    td.sms_sid = hash[:SmsSid]
    td.account_sid = hash[:AccountSid]
    td.text_to = hash[:To]
    td.text_from = hash[:From]
    td.num_media = hash[:NumMedia]
    td
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