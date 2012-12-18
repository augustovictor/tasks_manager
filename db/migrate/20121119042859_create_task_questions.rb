class CreateTaskQuestions < ActiveRecord::Migration
  def change
    create_table :task_questions do |t|
      t.string :type_questioning
      t.text :message
      t.references :task

      t.timestamps
    end
    add_index :task_questions, :task_id
  end
end
