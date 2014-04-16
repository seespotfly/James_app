class Organization < ActiveRecord::Base

  belongs_to :relationship
  validates :relationship_id, presence: true

  has_many :text_data, class_name: "TextData", foreign_key: "company_id"

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

  def to_s
    [name, relationship_name].join(": ")
  end

end
