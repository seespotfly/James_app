class RemoveRelationshipFromUser < ActiveRecord::Migration
  def up
    User.all.each do |u|
      # [FIXME] Make sure that the company is created with the proper relationship type
      
    end
    remove_column :users, :relationship
    remove_column :users, :company
    add_column :users, :company_id, :integer
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't restore relationship to User"
  end
end
