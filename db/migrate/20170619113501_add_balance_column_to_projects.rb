class AddBalanceColumnToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :balance, :decimal
  end
end
