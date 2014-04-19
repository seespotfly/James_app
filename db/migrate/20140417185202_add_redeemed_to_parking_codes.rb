class AddRedeemedToParkingCodes < ActiveRecord::Migration
  def change
    add_column :parking_codes, :redeemed, :boolean, {null: false, default: false}
  end
end
