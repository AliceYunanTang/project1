class CreateTimeEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :time_entries do |t|
      t.integer :user_id
      t.integer :project_id
      t.time :start_time
      t.time :end_time
      t.float :time

      t.timestamps
    end
  end
end
