class CreateContestantsEventsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :contestants, :events do |t|
      # t.index [:contestant_id, :event_id]
      # t.index [:event_id, :contestant_id]
    end
  end
end
