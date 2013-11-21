class ParkingCode < ActiveRecord::Base
  validates :code, presence: true
  validates :code, uniqueness: true
  validates_length_of :code, :maximum => 8
  validates_length_of :code, :minimum => 8
  validates :codedate, uniqueness: true

  def self.code_for(date)
    pc = ParkingCode.where(codedate: date).first
    if pc.nil?
      pc
    else
      pc.code
    end
  end
end
