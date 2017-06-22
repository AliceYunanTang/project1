class ChangeStartEndTimeToDatetimeInTimeEntry < ActiveRecord::Migration[5.0]

  def up
    change_column :time_entries, :start_time,  :time
    change_column :time_entries, :end_time,  :time
  end

  def down
    change_column :time_entries, :start_time,  :datetime
    change_column :time_entries, :end_time,  :datetime
  end
end
