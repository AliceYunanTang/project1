class AddTimeColumnAmountColumnToTimeEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :time_entries, :time, :decimal
    add_column :time_entries, :amount, :decimal
  end
end
