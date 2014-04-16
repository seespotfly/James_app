class AddCompanyToTextData < ActiveRecord::Migration
  def change
    add_column :text_data, :company_id, :integer
    TextData.all.each do |td|
      next if td.user.nil?
      td.company_id = td.user.company_id
      td.save
    end
  end
end
