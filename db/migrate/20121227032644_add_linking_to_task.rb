class AddLinkingToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :linked_task, :integer
  end
end
