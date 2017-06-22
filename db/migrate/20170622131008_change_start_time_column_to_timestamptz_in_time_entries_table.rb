class ChangeStartTimeColumnToTimestamptzInTimeEntriesTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :time_entries, :start_time,  :datetime
    add_column :time_entries, :start_time,  :timestamptz
    remove_column :time_entries, :end_time,  :datetime
    add_column :time_entries, :end_time,  :timestamptz
  end
end
