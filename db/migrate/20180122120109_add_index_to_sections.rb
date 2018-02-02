class AddIndexToSections < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :suite_id, :integer
    add_index :sections, :suite_id
  end
end
