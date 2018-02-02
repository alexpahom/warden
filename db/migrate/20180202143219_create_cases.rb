class CreateCases < ActiveRecord::Migration[5.1]
  def change
    create_table :cases do |t|
      t.integer :section_id
      t.string :title
      t.string :template
      t.text :precondition
      t.text :steps
      t.text :exp_result

      t.timestamps
    end
    add_index :cases, :section_id
  end
end
