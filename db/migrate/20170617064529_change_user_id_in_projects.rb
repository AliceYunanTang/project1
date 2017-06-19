class ChangeUserIdInProjects < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :project_id, :integer
  end
end
