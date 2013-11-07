class ParkingCode < ActiveRecord::Base
  validates :code, presence: true
  validates :code, uniqueness: true
  validates_length_of :code, :maximum => 8
  validates_length_of :code, :minimum => 8
  validates :codedate, uniqueness: true

  def self.message_for(date)
    pc = ParkingCode.where(codedate: Date.today).first
    if pc.nil?
      "I don't have today's parking code."
    else
      pc.code
    end
  end
end
