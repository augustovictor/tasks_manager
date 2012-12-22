class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.references :user
      t.references :project

      t.timestamps
    end
    add_index :participants, :user_id
    add_index :participants, :project_id
  end
end
