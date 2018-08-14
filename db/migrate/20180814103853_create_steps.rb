class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.integer :case_id
      t.integer :position
      t.text :action

      t.timestamps
    end
    add_index :steps, :case_id
  end
end
