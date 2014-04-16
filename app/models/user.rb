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
  validates :company_id, presence: true

  belongs_to :organization, foreign_key: :company_id

  has_many :text_data, class_name: "TextData"

  #Validates that an incomming phone number is a user in the system
  def self.find_sender(phone_number)
    User.where(phone_number: phone_number).first
  end

  def company_name
    organization.name
  end

  delegate :under_limit?, to: :organization
  delegate :texts_left, to: :organization


end





