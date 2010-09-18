class CreateListItems < ActiveRecord::Migration
  def self.up
    create_table :list_items do |t|
      t.integer :list_id
      t.integer :user_id
      t.string :name
      t.text :description
      t.date :due_date
      t.boolean :is_complete
      t.datetime :completed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :list_items
  end
end
