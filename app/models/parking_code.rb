class ParkingCode < ActiveRecord::Base
  validates :code, presence: true
  validates :code, uniqueness: true
  validates_length_of :code, :maximum => 8
  validates_length_of :code, :minimum => 8
  validate :unique_codedate_per_scheme
  
  def unique_codedate_per_scheme
    if Setting.date_scheme?
      # [FIXME] reinstate this, otherwise multiple codes for one date OK, 
      # too human-error prone
    else
      true
    end
  end

  def self.available
    where(redeemed: false)
  end

  def self.code_for(date)
    pc = ParkingCode.where(codedate: date).first
    if pc.nil?
      pc
    else
      pc.code
    end
  end

  def self.codes_for(qty)
    pcs = ParkingCode.available.limit(qty)
    if pcs.nil? || pcs.empty?
      pcs
    else
      pcs
    end
  end

  def self.codes_to_txt(parking_codes)
    if parking_codes.nil?
      nil
    elsif parking_codes.empty?
      ""
    else
      code_to_txt = ""
      parking_codes.each_with_index do |pc, i|
        code_to_txt << "Code #{i}: #{pc.code}\n"
      end
      code_to_txt
    end
  end
end
