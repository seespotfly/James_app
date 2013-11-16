class TextData < ActiveRecord::Base

belongs_to :user

  def codedate
    ParkingCode.code_for(text_date)
  end

#  def text_date
#    string = self.text_body
#    date = Date.parse(string)
#  end

  def self.text_date(:Body)
    string = text_date
    date = Date.parse(string)
  end

#    if (Date.parse(:body))
#      return codedate
#    else
#      return false
#    end

#    Date.today

end