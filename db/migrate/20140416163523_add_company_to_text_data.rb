class AddCompanyToTextData < ActiveRecord::Migration
  def change
    add_column :text_data, :company_id, :integer
  end
end
