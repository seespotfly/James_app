class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.string :name
      t.integer :text_count

      t.timestamps
    end
    {
      'Desk' => 1,
      'Office' => 5,
      'Suite' => 18,
      'Partner' => 22,
      'Owner' => 100
    }.each do |type, count|
      Relationship.create(name: type, text_count: count)
    end if Relationship.count == 0
  end
end
