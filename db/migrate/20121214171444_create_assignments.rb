class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :user
      t.references :task

      t.timestamps
    end
    add_index :assignments, :user_id
    add_index :assignments, :task_id
  end
end
