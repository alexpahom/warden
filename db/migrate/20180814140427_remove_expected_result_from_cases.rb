class RemoveExpectedResultFromCases < ActiveRecord::Migration[5.1]
  def change
    remove_column :cases, :exp_result
  end
end
