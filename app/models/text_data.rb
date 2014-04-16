class TextData < ActiveRecord::Base

  belongs_to :user, class_name: "User"
  belongs_to :organization, foreign_key: :company_id

  attr_accessor :outgoing_sms_body

  def user_name
    user.nil? ? "N/A" : user.name
  end

  def organization_name
    organization.nil? ? "N/A" : organization.name
  end 

  def codedate
    pc = ParkingCode.code_for(parse_date_from_body)
    if pc.nil?
      "not in the system, please use YY-MM-DD format."
    else
      self.update_attribute(:text_success, true)
      pc
    end
  end

  #Code to define the Body of the text as a date
  def parse_date_from_body
    string = self.text_body
    if !string.blank?
      begin
        Date.parse(string)
      rescue ArgumentError
        nil
      end
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
    td.locate(hash)
    td.evaluate
  end

  def locate(hash)
    sender = hash[:From]
    return unless sender
    self.user = User.find_sender(sender[1..11])
    if self.user
      self.organization = self.user.organization
    end
  end

  def evaluate
    if Setting.date_scheme?
      pc = ParkingCode.code_for(parse_date_from_body)
      if pc.nil?
        self.text_success = false
        self.outgoing_sms_body = "We do not have a parking code for that input.  Use YYYY-MM-DD with the date you'd like a code"
      else
        if user
          self.text_success = true
          self.outgoing_sms_body = if user.under_limit?
            "The parking code for #{parse_date_from_body} is #{pc}. You have #{user.texts_left} free codes left."
          else
            "The parking code for #{parse_date_from_body} is #{pc}. You're #{user.texts_left.abs} over your limit."
          end
        else
          self.text_success = false
          self.outgoing_sms_body = "You are not authorized to request parking codes from this phone number."
        end
      end
    else
      self.text_success = false
    end
    self
  end
end
