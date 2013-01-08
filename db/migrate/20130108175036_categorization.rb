class Categorization < ActiveRecord::Migration
  def up
    create_table :categorizations do |t|
      t.references :task
      t.references :category
    end
    add_index :categorizations, :task_id
    add_index :categorizations, :category_id
  end

  def down
    drop_table categorizations
  end
end
