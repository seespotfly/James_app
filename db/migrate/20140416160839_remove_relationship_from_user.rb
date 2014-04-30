class RemoveRelationshipFromUser < ActiveRecord::Migration
  def up
    add_column :users, :company_id, :integer
    User.reset_column_information
    User.all.each do |u|
      c = Organization.find_by_name(u.company)
      if c.nil?
        r = Relationship.find_by_name(u.relationship)
        if r.nil?
          if u.relationship == "Tenant"
            r = Relationship.find_by_name("Desk")
          elsif u.relationship == "Packard Place"
            r = Relationship.find_by_name("Owner")
          end
        end
        c = Organization.create(name: u.company, relationship_id: r.id)
      end
      puts "Updating #{u.name}: #{c.to_s}"
      u.company_id = c.id
      u.save
    end
    remove_column :users, :relationship
    remove_column :users, :company
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't restore relationship to User"
  end
end
