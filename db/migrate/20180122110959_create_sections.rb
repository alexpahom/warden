class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :title
      t.text :description
      t.integer :parent_id

      t.timestamps
    end
  end
end
