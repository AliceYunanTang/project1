class ChangeStartEndTimeToDatetimeInTimeEntry < ActiveRecord::Migration[5.0]
  def change
    change_column :time_entries, :start_time,  :datetime
    change_column :time_entries, :end_time,  :datetime
  end
end
