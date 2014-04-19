require 'spec_helper'

describe ParkingCode do

  context "validation" do

    subject{ build(:parking_code) }

    it{ should be_valid }

    context "for single-use code" do
      subject{ build(:single_use_parking_code) }
      it{ should be_valid }
    end

  end
end
