class AddProjectIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :project_id, :integer
  end
end
