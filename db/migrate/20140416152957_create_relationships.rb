class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.string :name
      t.integer :text_count

      t.timestamps
    end
  end
end
