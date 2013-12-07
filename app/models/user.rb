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

#set by relationships: desk, office, suite, partner, packard
   def code_limit(relationship)
     User.relationship(desk: 1, office: 5, suite: 10, partner: 5, packard: 100)
  end

end


#   def code_limit(relationship)
#     User.relationship(desk: 1, office: 5, suite: 10, partner: 5, packard: 100)
# #    desk = 1
# #    office = 5
# #    suite = 10
# #    partner = 5
# #    packard = 100
#   end

  # def code_limit(relationship)
  #   cl = User.relationship
  #   cl.desk = 1
  #   cl.office = 10
  #   cl.suite = 5
  #   cl.partner = 5
  #   cl.packard = 100






