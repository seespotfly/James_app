class Organization < ActiveRecord::Base

  belongs_to :relationship
  
  def relationship_name
    relationship.name
  end

end
