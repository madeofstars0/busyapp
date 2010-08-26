class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
    
    add_index :lists, [ :user_id, :name ], :unique => true
  end

  def self.down
    drop_table :lists
    drop_index :lists
  end
end
