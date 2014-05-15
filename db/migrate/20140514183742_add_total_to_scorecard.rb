class AddTotalToScorecard < ActiveRecord::Migration
  def change
    add_column :scorecards, :total, :integer
  end
end
