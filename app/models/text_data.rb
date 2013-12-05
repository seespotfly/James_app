class TextData < ActiveRecord::Base

belongs_to :user

  def codedate
    pc = ParkingCode.code_for(text_date)
      if pc.nil?
        "I don't have a code for that date."
      else
        self.update_attribute(:text_success, true)
        pc
      end
  end

#Code to define the Body of the text as a date
  def text_date
    string = self.text_body
    date = Date.parse(string)
  end

#Code to associate :Body, etc. from twilio with text_body, etc. in the DB
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
end
#    Date.today
