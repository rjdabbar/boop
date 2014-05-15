class AddEventIdToContestant < ActiveRecord::Migration
  def change
    add_column :contestants, :event_id, :integer
  end
end
