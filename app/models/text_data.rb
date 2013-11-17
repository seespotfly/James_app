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