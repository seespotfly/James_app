class CreateParkingCodes < ActiveRecord::Migration
  def change
    create_table :parking_codes do |t|
      t.integer :code
      t.date :codedate

      t.timestamps
    end
  end
end
