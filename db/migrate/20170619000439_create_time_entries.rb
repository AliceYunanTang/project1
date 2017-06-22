class CreateTimeEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :time_entries do |t|
      t.integer :user_id
      t.integer :project_id
      t.datetime :start_time
      t.datetime :end_time
      t.float :time

      t.timestamps
    end
  end
end
