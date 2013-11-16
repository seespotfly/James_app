class TextData < ActiveRecord::Base

belongs_to :user

  def codedate
    ParkingCode.code_for(text_date)
  end

  def text_date
    string = :Body
    date = Date.parse(string)
  end

#    if (Date.parse(:body))
#      return codedate
#    else
#      return false
#    end

#    Date.today

end