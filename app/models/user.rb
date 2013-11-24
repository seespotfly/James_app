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

  has_many :text_data

#all my validations are happy!

  def self.find_sender(phone_number)
    User.where(phone_number: phone_number).first
  end

#  def text_count
#    text_data.count
#  end

#To count the number of successful codes given by user

#samples:
#visits.by_month(@month).select("DISTINCT(household_id)").count

end

