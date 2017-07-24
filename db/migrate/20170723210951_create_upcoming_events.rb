class CreateUpcomingEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :upcoming_events do |t|

      t.timestamps
    end
  end
end
