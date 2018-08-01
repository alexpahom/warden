class AddSuiteIdAndRankToCases < ActiveRecord::Migration[5.1]
  def change
    add_column :cases, :suite_id, :integer
    add_column :cases, :rank, :integer
    add_index :cases, :suite_id
  end
end
