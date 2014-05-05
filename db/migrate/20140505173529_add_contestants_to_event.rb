class AddContestantsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :contestant_id, :integer
  end
end
