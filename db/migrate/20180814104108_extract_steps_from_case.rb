class ExtractStepsFromCase < ActiveRecord::Migration[5.1]
  def change
    remove_column :cases, :steps
  end
end
