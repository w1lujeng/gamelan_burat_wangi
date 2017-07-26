class RemoveAdminFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :admin, :boolean
  end
end
