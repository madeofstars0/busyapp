class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :icon
      t.string :status
      t.text :tags
      t.date :due_date
      t.datetime :completed_at
      
      t.references :list
      t.references :context
      t.references :project

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
