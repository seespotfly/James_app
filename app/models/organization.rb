class Organization < ActiveRecord::Base

  belongs_to :relationship
  validates :relationship_id, presence: true

  has_many :text_data, class_name: "TextData"

  def relationship_name
    relationship.name
  end

  def text_count
    TextData.company_count(self)
  end

  def texts_left
    relationship.text_count - self.text_count
  end

  def under_limit?
    relationship.text_count > self.text_count
  end

end
