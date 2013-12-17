class User < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone_number, presence: true
  validates :phone_number, uniqueness: true
  validates_numericality_of :phone_number, only_integer: true,
    :message => "can only contain numbers, no dashes or parentheses are allowed"
  validates_length_of :phone_number, :maximum => 11
  validates_length_of :phone_number, :minimum => 11,
    :message => "must start with 1 followed by area code then number"
  validates :relationship, presence: true

  has_many :text_data, class_name: "TextData"

#Validates that an incomming phone number is a user in the system
  def self.find_sender(phone_number)
    User.where(phone_number: phone_number).first
  end

#count successful texts
  def text_count
    text_data.where(text_success:true).
      where(["extract(month from created_at) = ?",Date.today.month]).
      where(["extract(year from created_at) = ?",Date.today.year]).count
  end

#set code limits by relationships: desk, office, suite, partner, packard
  def code_limit; {
    'Desk' => 1,
    'Office' => 5,
    'Suite' => 10,
    'Partner' => 10,
    'Packard Place' => 100
    }
  end

  def text_limit
    code_limit[user.relationship] <= user.text_count
  end

end






