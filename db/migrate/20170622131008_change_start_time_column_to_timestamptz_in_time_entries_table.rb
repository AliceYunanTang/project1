class ChangeStartTimeColumnToTimestamptzInTimeEntriesTable < ActiveRecord::Migration[5.0]
  def change
    change_column :time_entries, :start_time,  :timestamptz
    change_column :time_entries, :end_time,  :timestamptz
  end
end
