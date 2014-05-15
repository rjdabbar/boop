class AddNameToScorecard < ActiveRecord::Migration
  def change
    add_column :scorecards, :name, :string
  end
end
