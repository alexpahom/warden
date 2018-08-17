class MergeExpResultModelToSteps < ActiveRecord::Migration[5.1]
  def change
    drop_table :exp_results
    rename_column :steps, :action, :actual_result
    add_column :steps, :expected_result, :text
  end
end
