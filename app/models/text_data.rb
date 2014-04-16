class TextData < ActiveRecord::Base

  belongs_to :user, class_name: "User"
  belongs_to :organization, foreign_key: :company_id

  def user_name
    user.nil? ? "N/A" : user.name
  end

  def organization_name
    organization.nil? ? "N/A" : organization.name
  end 

  def codedate
    pc = ParkingCode.code_for(text_date)
    if pc.nil?
      "not in the system, please use YY-MM-DD format."
    else
      self.update_attribute(:text_success, true)
      pc
    end
  end

  #Code to define the Body of the text as a date
  def text_date
    string = self.text_body
    if !string.nil?
      Date.parse(string)
    else
      Date.today
    end
  end

  def self.company_count(company)
    company.text_data.where(text_success:true).
      where(["extract(month from created_at) = ?",Date.today.month]).
      where(["extract(year from created_at) = ?",Date.today.year]).count
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
