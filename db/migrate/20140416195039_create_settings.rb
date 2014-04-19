class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :code_scheme

      t.timestamps
    end
    Setting.create(code_scheme: 0) if Setting.count == 0
  end
end
