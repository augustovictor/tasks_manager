class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :priority, default: 1
      t.boolean :done, default: false
      t.datetime :deadline

      t.timestamps
    end
  end
end
