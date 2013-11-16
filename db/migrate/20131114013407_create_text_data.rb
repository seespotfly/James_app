class CreateTextData < ActiveRecord::Migration
  def change
    create_table :text_data do |t|
      t.string :message_sid
      t.string :sms_sid
      t.string :account_sid
      t.string :text_to
      t.string :text_from
      t.string :text_body
      t.string :num_media
      t.integer :user_id

      t.timestamps
    end
  end
end
