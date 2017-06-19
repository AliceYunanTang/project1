class AddDescriptionColumnLocationColumnToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :description, :string
    add_column :projects, :location, :string
  end
end
