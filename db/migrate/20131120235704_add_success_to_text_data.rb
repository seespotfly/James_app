class AddSuccessToTextData < ActiveRecord::Migration
  def change
    add_column :text_data, :text_success, :boolean
  end
end
