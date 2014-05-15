class CreateScorecards < ActiveRecord::Migration
  def change
    create_table :scorecards do |t|
      t.integer :lyrics
      t.integer :stage_presence
      t.integer :creativity
      t.integer :delivery_and_flow
      t.integer :crowd_response
      t.belongs_to :user, index: true
      t.belongs_to :contestant, index: true
      t.belongs_to :event, index: true

      t.timestamps
    end
  end
end
