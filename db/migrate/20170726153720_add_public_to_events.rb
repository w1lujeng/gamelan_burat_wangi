class AddPublicToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :admin, :boolean
  end
end
