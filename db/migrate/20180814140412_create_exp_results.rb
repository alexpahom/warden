class CreateExpResults < ActiveRecord::Migration[5.1]
  def change
    create_table :exp_results do |t|
      t.integer :case_id
      t.integer :position
      t.text :action

      t.timestamps
    end
    add_index :exp_results, :case_id
  end
end
