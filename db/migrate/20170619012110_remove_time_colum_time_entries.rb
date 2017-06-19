class RemoveTimeColumTimeEntries < ActiveRecord::Migration[5.0]
  def change
    remove_column :time_entries, :time
  end
end
