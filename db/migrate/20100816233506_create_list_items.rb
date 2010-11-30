class CreateListItems < ActiveRecord::Migration
  def self.up
    create_table :list_items do |t|
      t.integer :list_id
      t.integer :user_id
      t.string :name, :null => false, :limit => 40
      t.text :description
      t.date :due_date
      t.boolean :is_complete, :null => false, :default => false
      t.datetime :completed_at

      t.timestamps
    end
    
    add_index :list_items, [:user_id, :list_id]
  end

  def self.down
    drop_index :list_items
    drop_table :list_items
  end
end
